#' OpenStreetMap Mapping utility
#' @author Theo Van Rooy <theo@royaltyanalytics.com>
#' @description The base level function for creating an interactive map with Open Street Maps
#' @usage OSMMap(df, ..., lat="lat", long="long", size=8, color="#00FFFF",popup='', group=NULL, layer="layer1")
#' @param df is a dataFrame containing (at the least) two features called "lat" and "long"
#' @param ... other parameters which can be passed into the mapping function see details.
#' @param lat indicates the column name of the df that gives the latitude of points or lines.
#' @param long indicates the column name of the df that gives the latitude of the points lines.
#' @param size indicates which column in the df gives the size of the marker, automatically scaled.
#' @param color indicates a column in the df which can be factored and split on for colors
#' @param popup indicates which column of the df provides text to place in the onClick popup for each map marker.
#' @param group indicates the column of the df that gives the line label for interpreting sequential points as a line rather than many markers. 
#' @param layer name for the layer to appear on the OSMMap Plot.
#' @param groupType indicates whether the grouping is for distinct lines or a closed off and infilled polygon options (LineString, Polygon).
#' @param tileLayer specifies a tile set to use as the basemap, defaults to Open Street Maps.
#' @param colorByFactor default T, picks a rainbow color for each unique color specified, F means it uses the hex colors specified.
#' @examples \dontrun{
#' #generate rand lats and longs near Denver,CO
#' df = data.frame(lat=runif(10, 38,40), long=-runif(10, 104,106), 
#'                size=runif(10)*20, color=sample(rainbow(3), 10, replace=TRUE),
#'                group=sample(1:3, 10,replace=TRUE))
#' #base plot
#' plot(OSMMap(df))
#' 
#' #plot with specified size and color for markers
#' plot(OSMMap(df, size='size', color='color'))
#' 
#' #plot out a set of lines
#' linePlot = OSMMap(df, group='group', groupType="line")
#' polygonPlot = OSMMap(df, group='group', groupType='polygon')
#' plot(linePlot) 
#' } 
#' @export 
#' @import RJSONIO plyr
#' @title OSMMap
OSMMap = function(df, ..., lat="lat", long="long", size=8, color='noCol',popup='', 
                  group=NULL, layer="layer1", groupType="LineString", tileLayer="NULL", colorByFactor=T,
                  static=F){
  
   if(size %in% colnames(df)){
     size = df[,size]
   }else{
     size = rep(size, nrow(df))
   }
   if(color %in% colnames(df)){
     if(colorByFactor){
       #pick out colors for each unique color factor
       cols=rainbow(length(unique(df[[color]])))
       cols = sapply(cols, function(x){
         return(paste(strsplit(x=as.character(x), split='')[[1]][1:7], sep='',collapse=''))
       })
       facdf = data.frame(colorVar=unique(df[[color]]), cols=cols)
       df[["colorVar"]] = df[[color]]
       df = merge(df, facdf, by="colorVar")
       colors = df$cols  
     }else{
       if(is.null(group)){
         #then it's a bunch of circle points to be plotted
         colors=df[,color]
       }else{
         #then it's a polygon or polyline
         facdf = ddply(df, .(as.quoted(group)), function(x)return(as.character(x[[color]][1])))
         colnames(facdf) = c(group, 'cols')
         
       }
     }
   }else{
     #then it's a single color specification for all points
     if(color!='noCol'){
         colors=rep(color, nrow(df))  
     }else{
       colors = rep("#000000", nrow(df))  
     }
   }
   
   if(popup %in% colnames(df)){
     if(!is.null(group)){
       popup = ddply(df, .(as.quoted(group)), function(x)return(as.character(x[[popup]][1])))[,2]
     }else{
       popup = df[,popup]  
     }
     
   }else{
     popup = rep(popup, nrow(df))
   }
   
   if(!is.null(group)){
     if(group %in% colnames(df)){
       lineGroup = df[,group]
     }else{
       stop('invalid column specification for line grouping variable')
     } 
   }
   
   mapCenterLat = mean(df[[lat]])
   mapCenterLong = mean(df[[long]])
   mz = c(0:19)
   mzd = 360/2^mz
   mMaxDeg = max(max(abs(df[[lat]]-mapCenterLat)), max(abs(df[[long]]-mapCenterLong)))
   zoom = mz[which(mMaxDeg>mzd)[1]]-1
   
   if(is.null(group)){
     type="Point"
   }else{
     type=groupType
   }
   iFor = ifelse(is.null(group), nrow(df), length(unique(lineGroup)))
   
   if(is.null(group)){
     colors=colors
   }else{
     colors=as.character(facdf$cols)
   }

   geoList = list()
   geoList[[1]] = list(layer=layer, data=list(type="FeatureCollection",
                  features=vector("list", iFor)
   ))
   for(i in 1:iFor){
     #if it's a Point then coordinates are a list of coordinates
     if(is.null(group)){
       coordinates = c(df[i, long], df[i, lat])
     }else{
       coordinates = list()
       coords = df[lineGroup==names(table(lineGroup))[i], ]
       for(il in 1:table(lineGroup)[i]){
         coordinates[[il]] = c(coords[il,long], coords[il, lat]) 
       }
     }
    
     ## if it's a polygon, you have to put it in another list
     if(!is.null(group) & groupType=="Polygon"){
       coordinates = list(coordinates)
     }
     geoList[[1]]$data$features[[i]] = list(geometry=list(type=type, 
                                                coordinates=coordinates
                                                ),
                                  type="Feature",
                                  properties=list(popupContent=popup[i],
                                                  color=colors[i],
                                                  size=size[i],
                                                  static=ifelse(static, "true", "false")
                                                  ),
                                  id=i
                                  )
   }
   
   
   geoJSON = toJSON(geoList) 
   output=list(geoList=geoList, geoJSON=geoJSON, zoom=zoom, mapCenterLat=mapCenterLat, mapCenterLong=mapCenterLong)
   class(output)="OSMMap"
   return(output)
}

#' OpenStreetMap Layer adding function
#' @author Theo Van Rooy <theo@royaltyanalytics.com>
#' @description Take two maps and mesh them so that the markers are on different layers
#' @usage addLayers(OSMMap1, OSMMap2)
#' @param OSMMap1 a map object resulting from the call to OSMMap
#' @param OSMMap2 another map object resulting from a call to OSMMap
#' @examples \dontrun{
#' dualMap = (addLayers(OSMMap(df, size='size', color='color'),
#' linePlot))
#' }
#' @export 
#' @import RJSONIO
#' @title addLayers
addLayers = function(OSMMap1, OSMMap2){
  #browser()
  newGeoList = list()
  
  for(i in 1:length(OSMMap1$geoList)){
    #add the old layer to the new list
    newGeoList[[i]] = OSMMap1$geoList[[i]]
    #change the layer name
    if(length(grep("layer",newGeoList[[i]]$layer))>0){
      newGeoList[[i]]$layer = paste0("layer", i, collapse='')  
    }
  }
  for(i in 1:length(OSMMap2$geoList)){
    j=i+length(OSMMap1$geoList)
    newGeoList[[j]] = OSMMap2$geoList[[i]]
    if(length(grep("layer",newGeoList[[j]]$layer))>0){
      newGeoList[[j]]$layer = paste0("layer", j, collapse='')  
    }
  }
  
  #compute new zoom and mapCenter 
  zoom = min(OSMMap1$zoom, OSMMap2$zoom)
  mapCenterLat = mean(OSMMap1$mapCenterLat, OSMMap2$mapCenterLat)
  mapCenterLong = mean(OSMMap1$mapCenterLong, OSMMap2$mapCenterLong)
  
  geoJSON = toJSON(newGeoList) 
  output=list(geoList=newGeoList, geoJSON=geoJSON, zoom=zoom, mapCenterLat=mapCenterLat, mapCenterLong=mapCenterLong,
              titleJSON="[]", legendJSON="[]")
  class(output)="OSMMap"
  return(output)
  
}


#' OpenStreetMap State and county level choropleth shape creating function
#' @author Theo Van Rooy <theo@royaltyanalytics.com>
#' @description Takes a df with a column marked for state and makes a choropleth plot for it with the color specified.
#' @usage choroplethMap(df, state, plotVariable,...,county, color)
#' @param state the name of the column in the df that provides the state name in full state name format (e.g. colorado)
#' @param plotVariable the name of the column in the df that provides the variable which can be used to produce heat map colored tiles
#' @param county the name of the column in the df that provides the county name in full county name format (e.g. weld)
#' @param color the name of the column which provides 6 digit (no alpha) hex colors for the state/county
#' @param palette 'red', 'green', 'blue' determines the shading of the heat colors.  White = lowest, Full color = highest
#' @param layerName a character vector specifying the name of the layer
#' @examples \dontrun{
#' state  = choroplethMap(df, 'state')
#' counties = choroplethMap(df, 'state', 'county')
#' }
#' @export 
#' @import RJSONIO, maps
#' @title choroplethMap
choroplethMap = function(df, state='state', plotVariable=NULL, ...,county=NULL, township=NULL, 
                         color=NULL, palette='red', layerName='layer',townshipData=NULL){
  if(!is.null(plotVariable)){
    if(plotVariable %in% colnames(df)){
      plotVar=df[,plotVariable]
      plotVarNorm = (plotVar-min(plotVar))/(max(plotVar)-min(plotVar))
      
      if(palette=='red'){
        colors = rgb(1, 1-plotVarNorm, 1-plotVarNorm)
      }
      if(palette=='green'){
        colors = rgb(1-plotVarNorm,1, 1-plotVarNorm)
      }
      if(palette=='blue'){
        colors = rgb(1-plotVarNorm, 1-plotVarNorm,1)  
      }
      if(palette=='bluered'){
        plotVarNorm=(2*plotVarNorm-1)
        
        colors = rep('#FFFFF', length(plotVarNorm))
        colors = ifelse(plotVarNorm>0, rgb(1-abs(plotVarNorm), 1-abs(plotVarNorm),1), colors)
        colors = ifelse(plotVarNorm<=0, rgb(1, 1-abs(plotVarNorm), 1-abs(plotVarNorm)), colors)
      }
      
    }else{
      stop('No plot variable to color state/counties by')
    }  
  }else{
    if(is.null(color)){
      stop('Either colors or a metric/plot variable must be specified')
    }
  }
  if(!is.null(state)){
    if(state %in% colnames(df)){
      states=df[,state]
    }else{
      stop('State variable not found in data.frame')
    }  
  }
  if(!is.null(county)){
    if(county %in% colnames(df)){
      counties=df[,county]
    }else{
      stop('County variable not found in data.frame')
    }  
  }
  if(!is.null(township)){
    if(township %in% colnames(df)){
      townships=df[,township]
    }else{
      stop('Township variable not found in data.frame')
    }  
  }
  if(!is.null(color)){
    if(color %in% colnames(df)){
      colors=df[,color]
    }else{
      stop('Color variable not found in data.frame')
    }  
  }
  
  if(is.null(township)){
    if(is.null(county)){
      statemap = data.frame(map_data('state'))
      dfmerge = data.frame(region=(states), metric=plotVar, color=colors)
      newDF = merge(statemap, dfmerge,by='region',)
      newDF = newDF[with(newDF, order(order)), ]
      newDF[["popup"]] = paste(newDF$region, newDF$metric, sep=" ") 
      return(OSMMap(newDF, group='group', color='color', popup='popup',groupType="Polygon",colorByFactor = F, layer=layerName))  
    }else{
      statemap = data.frame(map_data('county'))
      dfmerge = data.frame(region=(states), subregion = counties, metric=plotVar, color=colors)
      newDF = merge(statemap, dfmerge,by=c('region', 'subregion'))
      newDF = newDF[with(newDF, order(order)), ]
      newDF[["popup"]] = paste(newDF$subregion, newDF$region, newDF$metric, sep=" ")
      return((OSMMap(newDF, group='group', color='color', popup='popup',groupType="Polygon",colorByFactor = F, layer=layerName)))  
    }
  }else{
    twpmap = townshipData#readRDS(paste0(system.file(package='OpenStreetMapR'), '/OK.rds'))
    dfmerge = data.frame(region=townships, metric=plotVar, color=colors)
    newDF = merge(twpmap, dfmerge,by=c('region'))
    newDF = newDF[with(newDF, order(order)), ]
    newDF[["popup"]] = paste(newDF$subregion, newDF$region, newDF$metric, sep=" ")
 
    return((OSMMap(newDF,group='group', color='color', popup='popup',groupType="Polygon",colorByFactor = F, layer=layerName))) 
  }
  
  
  
}

subGridChoropleth = function(){
  #this function lets you divide up the state or county into evenly sized grids for plotting information.
  
}