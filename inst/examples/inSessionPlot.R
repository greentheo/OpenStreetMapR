
library(ggplot2)
library(plyr)
#generate rand lats and longs near Denver,CO
df = data.frame(lat=runif(100, 38,40), long=-runif(100, 104,106), 
                size=runif(100)*20, color=sample(letters[1:3], 100, replace=TRUE),
                group=sample(1:3, 100,replace=TRUE))
#base plot
plot(OSMMap(df))

#plot with specified size and color for markers
plot(OSMMap(df, size='size', color='color'))

#plot circles with assigned colors
df[["colorsRGB"]] = gray(runif(nrow(df)))
plot(OSMMap(df, size='size', color='colorsRGB',colorByFactor = F))

#plot out a set of lines
linePlot = OSMMap(df, group='group', color='color',groupType="LineString")
plot(linePlot)

polyPlot = OSMMap(df, group='group', color='color', groupType="Polygon")
plot(polyPlot)

polyPlot = OSMMap(df, group='group', color='color', groupType="Polygon",static=T)
plot(polyPlot)

#add the points map and lines map together
dualMap = (addLayers(OSMMap(df, size='size', color='color'),
                       linePlot))
plot(dualMap)

#or just print out the HTML for the object for use in reports.
print(dualMap)


#generate the state shapes and plot them on the map filled in by color
df = data.frame(state=sample(unique(map_data("state")$region), 49,replace=F),
                metric=runif(49)
)

#choropleth by state .. default heat coloring scheme
choroMap = choroplethMap(df, state='state', plotVariable='metric')
plot(choroMap)

#choropleth by state with custom colors assigned to the state
df[["hexColor"]]=sample(rgb(runif(10), runif(10), runif(10)), nrow(df), replace = T)
choroMap = choroplethMap(df, state='state', plotVariable='metric', color="hexColor")
plot(choroMap)

#choropleth at the county level data for Colorado
counties = map_data("county")
df = data.frame(state="colorado", county=unique(counties[counties$region=='colorado',"subregion"]),
                metric=runif(64)
)

choroMapRed = choroplethMap(df, state='state', county='county',plotVariable='metric',palette = 'red', layerName='Red Layers')
plot(choroMapRed)
df$metric = runif(64)
choroMapBlue = choroplethMap(df, state='state', county='county',plotVariable='metric',palette = 'blue', layerName='Blue Layers')
df$metric = runif(64)
choroMapGreen = choroplethMap(df, state='state', county='county',plotVariable='metric',palette = 'green', layerName='Green Layers')

df$metric = cut(runif(64), breaks=5, labels = F)
choroMapBlueRed = choroplethMap(df, state='state', county='county',plotVariable='metric',palette = 'bluered', layerName='BlueRed')
plot(choroMapBlueRed)

plot(addLayers(addLayers(OSMMap1 = choroMapRed, OSMMap2 = choroMapGreen), choroMapBlue), 
     title = 'A Random coloring of Counties',
     subtitle = 'With Red, Blue and Green Color scales',
     desc='The colors range from white to dark, darker = higher level of metrics.')

print(addLayers(addLayers(OSMMap1 = choroMapRed, OSMMap2 = choroMapGreen), choroMapBlue), 
     title = 'A Random coloring of Counties',
     subtitle = 'With Red, Blue and Green Color scales',
     desc='The colors range from white to dark, darker = higher level of metrics.')


#generate township level data for weld county Colorado
twpOK = readRDS('inst/OK.rds')
df = data.frame(township=sample(unique(twpOK$region), 300),
                metric=sample(1:4, 15, replace = T)
)

choroMapRed = choroplethMap(df, state=NULL,township='township',plotVariable='metric',
                            palette = 'red', layerName='Red Township Layers',
                            townshipData=twpOK)
plot(choroMapRed)

