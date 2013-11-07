library(OpenStreetMapR)
#generate rand lats and longs near Denver,CO
df = data.frame(lat=runif(10, 38,40), long=-runif(10, 104,106), 
                size=runif(10)*20, color=sample(rainbow(3), 10, replace=TRUE),
                line=sample(1:3, 10,replace=TRUE))
#base plot
plot(OSMMap(df))

#plot with specified size and color for markers
plot(OSMMap(df, size='size', color='color'))

#plot out a set of lines
linePlot = OSMMap(df, line='line')
plot(linePlot)

#add the points map and lines map together
dualMap = (addLayers(OSMMap(df, size='size', color='color'),
                       linePlot))
plot(dualMap)

#or just print out the HTML for the object for use in reports.
print(dualMap)
