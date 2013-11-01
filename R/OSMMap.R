#' OpenStreetMap Mapping utility
#' @author Theo Van Rooy <theo@royaltyanalytics.com>
#' @description The base level function for creating an interactive map with Open Street Maps
#' @usage OSMMap(df, ..., lat="lat", long="long", size=8, color="#00FFFF",popup='', line=NULL, layer="layer1")
#' @param df is a dataFrame containing (at the least) two features called "lat" and "long"
#' @param ... other parameters which can be passed into the mapping function see details.
#' @param lat indicates the column name of the df that gives the latitude of points or lines.
#' @param long indicates the column name of the df that gives the latitude of the points lines.
#' @param size indicates which column in the df gives the size of the marker, automatically scaled.
#' @param color indicates which column of the df gives the color, must be valid hex colors.
#' @param popup indicates which column of the df provides text to place in the onClick popup for each map marker.
#' @param line indicates the column of the df that gives the line label for interpreting sequential points as a line rather than many markers. 
#' @param layer name for the layer to appear on the OSMMap Plot. 
#' @examples \dontrun{
#' #generate rand lats and longs near Denver,CO
#' df = data.frame(lat=runif(10, 38,40), long=-runif(10, 104,106), 
#'                size=runif(10)*20, color=sample(rainbow(3), 10, replace=TRUE),
#'                line=sample(1:3, 10,replace=TRUE))
#' #base plot
#' plot(OSMMap(df))
#' 
#' #plot with specified size and color for markers
#' plot(OSMMap(df, size='size', color='color'))
#' 
#' #plot out a set of lines
#' linePlot = OSMMap(df, line='line')
#' plot(linePlot) 
#' } 
#' @export 
#' @import RJSONIO
#' @title OSMMap
OSMMap = function(df, ..., lat="lat", long="long", size=8, color="#00FFFF",popup='', line=NULL, layer="layer1"){
   if(size %in% colnames(df)){
     size = df[,size]
   }else{
     size = rep(size, nrow(df))
   }
   if(color %in% colnames(df)){
     colors = df[,color]
   }else{
     colors = rep(color, nrow(df))
   }
   
   #if you are using hex colors R appends an alpha (8 hex characters), 
   #only want the first 6
   colors = sapply(colors, function(x){
     return(paste(strsplit(x=as.character(x), split='')[[1]][1:7], sep='',collapse=''))
   })
   
   if(popup %in% colnames(df)){
     popup = df[,popup]
   }else{
     popup = rep(popup, nrow(df))
   }
   
   if(!is.null(line)){
     if(line %in% colnames(df)){
       lineGroup = df[,line]
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
   
   type=ifelse(is.null(line), "Point", "LineString")
   iFor = ifelse(is.null(line), nrow(df), length(unique(lineGroup)))
   geoList = list()
   geoList[[1]] = list(layer=layer, data=list(type="FeatureCollection",
                  features=vector("list", iFor)
   ))
   for(i in 1:iFor){
     #if it's a Point then coordinates are a list of coordinates
     if(is.null(line)){
       coordinates = c(df[i, long], df[i, lat])
     }else{
       coordinates = list()
       coords = df[lineGroup==names(table(lineGroup))[i], ]
       for(il in 1:table(lineGroup)[i]){
         coordinates[[il]] = c(coords[il,long], coords[il, lat]) 
       }
     }
     
     
     geoList[[1]]$data$features[[i]] = list(geometry=list(type=type, 
                                                coordinates=coordinates
                                                ),
                                  type="Feature",
                                  properties=list(popupContent=popup[i],
                                                  color=colors[i],
                                                  size=size[i]
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
    if(grep("layer",newGeoList[[i]]$layer)){
      newGeoList[[i]]$layer = paste0("layer", i, collapse='')  
    }
  }
  for(i in 1:length(OSMMap2$geoList)){
    j=i+length(OSMMap1$geoList)
    newGeoList[[j]] = OSMMap2$geoList[[i]]
    if(grep("layer",newGeoList[[j]]$layer)){
      newGeoList[[j]]$layer = paste0("layer", j, collapse='')  
    }
  }
  
  #compute new zoom and mapCenter 
  zoom = min(OSMMap1$zoom, OSMMap2$zoom)
  mapCenterLat = mean(OSMMap1$mapCenterLat, OSMMap2$mapCenterLat)
  mapCenterLong = mean(OSMMap1$mapCenterLong, OSMMap2$mapCenterLong)
  
  geoJSON = toJSON(newGeoList) 
  output=list(geoList=newGeoList, geoJSON=geoJSON, zoom=zoom, mapCenterLat=mapCenterLat, mapCenterLong=mapCenterLong)
  class(output)="OSMMap"
  return(output)
  
}
