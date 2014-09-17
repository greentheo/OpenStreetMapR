#print <- function(OSMMap) UseMethod("print")

#' OpenStreetMap Printing (for use in RHTML or RMarkDown reports)
#' @author Theo Van Rooy <theo@royaltyanalytics.com>
#' @description print the OSMMap Object to it's corresponding HTML/JS code.
#' @usage print.OSMMap(x,...)
#' @aliases print
#' @param x an OSMMap object resulting from the call to OSMMap or addLayers
#' @param ... further arguments
#' @method  print OSMMap
# @S3method OSMMap print
# @example examples/inSessionPlot.R
#' @export 
#' @import RJSONIO
#' @title print.OSMMap
print.OSMMap <- function(x,...,title='OpenStreetMapR',subtitle='<a href="https://github.com/greentheo/OpenStreetMapR/">Github Link</a>',desc='',returnText=F){
  
  OSMMap=x
  #html = readLines('inst//OSMPrintBrew.brew.html')
  html = readLines(paste0(system.file(package='OpenStreetMapR'), '/OSMPrintBrew.brew.html'),warn = F)
  html = paste0(html, '\n')
  mapID = paste0('OSMMap',round(runif(1)*10000))
  html = gsub('OSMMapID',mapID, html)
  html = gsub('theRgeneratedgeoJSON', OSMMap$geoJSON, html)
  html = gsub('RgeneratedTitle', title, html)
  html = gsub('RgeneratedSubTitle', subtitle, html)
  html = gsub('RgeneratedDesc', desc, html)
  html = gsub('mapCenterLat', OSMMap$mapCenterLat, html)
  html = gsub('mapCenterLong', OSMMap$mapCenterLong, html)
  html = gsub('mapZoomLevel', OSMMap$zoom, html) 
  if(returnText){
    return(html)
  }else{
    cat(html)  
  }
  
}

#' OpenStreetMap Internal Function
#' @author Theo Van Rooy <theo@royaltyanalytics.com>
#' @description Check to the see if the R server is running.
#' @usage isServerRunning()
#' @export 
#' @title isServerRunning
isServerRunning <- function() {
  #tools:::httpdPort > 0L
  tools:::httpdPort > 0L
}

#' OpenStreetMap Internal Function for handling http requests
#' @author Theo Van Rooy <theo@royaltyanalytics.com>
#' @description Setup the R webserver properly.
#' @usage OSMMap.httpd.handler(path, query,...)
#' @param path a path to run the webserver in
#' @param query not used
#' @param ... additional arguments
#' @export 
#' @title isServerRunning
OSMMap.httpd.handler <- function(path, query,...) {
  path <- gsub("^/custom/OpenStreetMapR/", "", path)
  f <- sprintf("%s%s%s",
               tempdir(),
               .Platform$file.sep,
               path) 
  list(file=f,
       "content-type"="text/html",
       "status code"=200L)
}
#plot <- function(OSMMap) UseMethod("plot")

#' OpenStreetMap Plotting for standalone usage.
#' @author Theo Van Rooy <theo@royaltyanalytics.com>
#' @description Plot the OSMMap Object on an HTML page and display it.
#' @usage plot.OSMMap(x,...)
#' @aliases plot
#' @method plot OSMMap
# @S3method OSMMap plot
#' @param x is an OSMMap object resulting from the call to OSMMap or addLayers
#' @param ... further plotting arguments
# @example examples/inSessionPlot.R
#' @export 
#' @import RJSONIO
#' @import tools
#' @title plot.OSMMap
#' 
plot.OSMMap <- function(x,...,title='OpenStreetMapR',subtitle='<a href="https://github.com/greentheo/OpenStreetMapR/">Github Link</a>',desc=''){
  OSMMap=x
    if(!isServerRunning() ) {
      #tools:::startDynamicHelp()
      tools::startDynamicHelp()
    }
    
    env <- get( ".httpd.handlers.env", asNamespace("tools"))
    env[["OpenStreetMapR"]] <- OSMMap.httpd.handler    
    root.dir <- tempdir()
    
    ## Write the whole visualisation into a html file
    if('OSMMap' %in% class(OSMMap)){          
      ## Write the pure chart html code into a separate file
      #html = readLines('inst//OSMPlotBrew.brew.html')
      html = readLines(paste0(system.file(package='OpenStreetMapR'), '/OSMPlotBrew.brew.html'),warn = F)
      html = paste0(html, '\n')
      mapID = paste0('OSMMap',round(runif(1)*10000))
      html = gsub('OSMMapID',mapID, html)
      html = gsub('theRgeneratedgeoJSON', OSMMap$geoJSON, html)
      html = gsub('RgeneratedTitle', title, html)
      html = gsub('RgeneratedSubTitle', subtitle, html)
      html = gsub('RgeneratedDesc', desc, html)
      html = gsub('mapCenterLat', OSMMap$mapCenterLat, html)
      html = gsub('mapCenterLong', OSMMap$mapCenterLong, html)
      html = gsub('mapZoomLevel', OSMMap$zoom, html)  
      
      
      file <- file.path(root.dir, paste(mapID ,".html", sep=""))
    }else{## not an OSM object
      stop('This is not an OpenStreetMapR object!')
    }    
    cat(html, file=file)
    #cat(html, file='inst/examples/testOutPut.html')
    
    .url <- sprintf("http://127.0.0.1:%s/custom/OpenStreetMapR/%s",
                    #tools:::httpdPort,
                    tools:::httpdPort,
                    basename(file))
    if(interactive()){
      browseURL(.url, ...)
    }else{ ## not interactive modus     
      browseURL(.url, browser='false',...)
    }
    invisible(file)
 
}

