shinyServer(function(input, output) {
  output$liveView = renderText({
    df = data.frame(lat=runif(100, 38,40), long=-runif(100, 104,106), 
                    size=runif(100)*20, color=sample(rainbow(10), 100, replace=T))
    print(OSMMap(df, size='size', color='color',layer = 'A sweet Layer'),returnText=T)
  })
  
  output$anotherView = renderText({
    counties = map_data("county")
    df = data.frame(state="colorado", county=unique(counties[counties$region=='colorado',"subregion"]),
                    metric=runif(64)
    )
    choroMapRed = choroplethMap(df, state='state', county='county',plotVariable='metric',palette = 'red', layerName='Red Layers')
    
    print(choroMapRed, 
          title = 'A Random coloring of Counties',
          subtitle = 'With Red, Blue and Green Color scales',
          desc='The colors range from white to dark, darker = higher level of metrics.',
          returnText=T)
    
  })
})