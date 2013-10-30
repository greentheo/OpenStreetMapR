#' OpenStreetMap Mapping utility
#' @author Theo Van Rooy theo@royaltyanalytics.com
#' @description The base level function for creating an interactive map with Open Street Maps
#' @usage OSMMap(df, ...)
#' @param df is a dataFrame containing (at the least) two features called "lat" and "long"
#' @param ... other parameters which can be passed into the mapping function see details.
#' @param size indicates which column in the df gives the size of the marker, automatically scaled.
#' @param color indicates which column of the df gives the color, must be valid hex colors.
#' @param line indicates the column of the df that gives the line label for interpreting sequential points as a line rather than many markers. 
# @example
#' @export 
#' @import RJSONIO
#' @title OSMMap

OSMMap = function(df=NULL, ..., lat="lat", long="long", size=8, color="#00FFFF",popup='', line=NULL, layer="layer1"){
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
   geoList = list(layer=layer, data=list(type="FeatureCollection",
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
     
     
     geoList$data$features[[i]] = list(geometry=list(type=type, 
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
   output=list(geoJSON=geoJSON, zoom=zoom, mapCenterLat=mapCenterLat, mapCenterLong=mapCenterLong)
   class(output)="OSMMap"
   return(output)
}

#' OpenStreetMap Layer adding function
#' @author Theo Van Rooy theo@royaltyanalytics.com
#' @description Take two maps and mesh them so that the markers are on different layers
#' @usage addLayer(OSMMap1, OSMMap2)
#' @param OSMMap1 a map object resulting from the call to OSMMap
#' @param OSMMap2 another map object resulting from a call to OSMMap
# @example
#' @export 
#' @import RJSONIO
#' @title OSMMap
addLayer = function(OSMMap1, OSMMap2){
  
  
#   class(output)="OSMMap"
}
