#' The print method for including it as a chart in something like RMarkdown
#' @export
print.OSMMap <- function(x, tag=NULL, file="", ...){
  
  html = readLines('inst//OSMPrintBrew.brew.html')
  html = readLines(paste0(system.file(package='OpenStreetMapR'), '/OSMPrintBrew.brew.html'))
  html = paste0(html, '\n')
  mapID = paste0('OSMMap',round(runif(1)*10000))
  html = gsub('OSMMapID',mapID, html)
  html = gsub('theRgeneratedgeoJSON', x$geoJSON, html)
  html = gsub('mapCenterLat', x$mapCenterLat, html)
  html = gsub('mapCenterLong', x$mapCenterLong, html)
  html = gsub('mapZoomLevel', x$zoom, html)  
  cat(html)
}

#' checks to see if the R server is running
#' @export
isServerRunning <- function() {
  tools:::httpdPort > 0L
}

#' When plotting the map this funciton handles the export 
#' @export
OSMMap.httpd.handler <- function(path, query, ...) {
  path <- gsub("^/custom/OpenStreetMapR/", "", path)
  f <- sprintf("%s%s%s",
               tempdir(),
               .Platform$file.sep,
               path) 
  list(file=f,
       "content-type"="text/html",
       "status code"=200L)
}

#' The plot method for taking the OSMMap and putting it in a web browser
#' @export
plot.OSMMap <- function(x, ...){
    
    if(!isServerRunning() ) {
      tools:::startDynamicHelp()
    }
    
    env <- get( ".httpd.handlers.env", asNamespace("tools"))
    env[["OpenStreetMapR"]] <- OSMMap.httpd.handler    
    root.dir <- tempdir()
    
    ## Write the whole visualisation into a html file
    if('OSMMap' %in% class(x)){          
      ## Write the pure chart html code into a separate file
      html = readLines('inst//OSMPlotBrew.brew.html')
      #html = readLines(paste0(system.file(package='OpenStreetMapR'), '/OSMPlotBrew.brew.html'))
      html = paste0(html, '\n')
      mapID = paste0('OSMMap',round(runif(1)*10000))
      html = gsub('OSMMapID',mapID, html)
      html = gsub('theRgeneratedgeoJSON', x$geoJSON, html)
      html = gsub('mapCenterLat', x$mapCenterLat, html)
      html = gsub('mapCenterLong', x$mapCenterLong, html)
      html = gsub('mapZoomLevel', x$zoom, html)  
      
      
      file <- file.path(root.dir, paste(mapID ,".html", sep=""))
    }else{## not an OSM object
      stop('This is not an OpenStreetMapR object!')
    }    
    cat(html, file=file)
    cat(html, file='examples/testOutPut.html')
    
    .url <- sprintf("http://127.0.0.1:%s/custom/OpenStreetMapR/%s",
                    tools:::httpdPort,
                    basename(file))
    if(interactive()){
      browseURL(.url, ...)
    }else{ ## not interactive modus     
      browseURL(.url, browser='false',...)
    }
    invisible(file)
 
}


gvisMerge <- function(x, y, horizontal=FALSE, tableOptions='border="0"',
                      chartid){
  
  type="gvisMerge"
  
  if(any(c(missing(x), missing(y))))
    stop("Please provide two gvis-objects as input parameters.\n")
  
  ## test x and y are givs objects
  if(!any(c(inherits(x, "gvis"),   inherits(y, "gvis"))))
    stop("x and y have to be gvis objects\n")
  
  if(missing(chartid)){   
    chartid <- paste("Merged", basename(tempfile(pattern="")),sep="ID")
  }
  
  htmlScaffold <- gvisHtmlWrapper(title="", chartid=chartid, dataName="various", type=type)
  
  output <- structure(
    list(type=type,
         chartid=chartid, 
         html=list(header=htmlScaffold[["htmlHeader"]],
                   chart=c(jsHeader=paste(x$html$chart["jsHeader"]),
                           jsData=paste(x$html$chart["jsData"], y$html$chart["jsData"], sep="\n"),
                           jsDrawChart=paste(x$html$chart["jsDrawChart"], y$html$chart["jsDrawChart"], sep="\n"),
                           jsDisplayChart=paste(x$html$chart["jsDisplayChart"], y$html$chart["jsDisplayChart"], sep="\n"),
                           jsFooter=paste(x$html$chart["jsFooter"]),
                           jsChart=paste(x$html$chart["jsChart"], y$html$chart["jsChart"], sep="\n"),
                           divChart= paste("\n<table ", tableOptions, ">\n<tr>\n<td>\n", x$html$chart["divChart"], "\n</td>\n",                            
                                           ifelse(horizontal,"<td>\n","</tr>\n<tr>\n<td>\n"), y$html$chart["divChart"],
                                           "\n</td>\n</tr>\n</table>\n", sep="")
                   ),
                   caption=htmlScaffold[["htmlCaption"]],
                   footer=htmlScaffold[["htmlFooter"]]
         )
    ),
    class=c("gvis", "list")
  )
  return(output) 
}