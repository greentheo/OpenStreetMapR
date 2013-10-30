#plot earthquake data

#generate rand lats and longs near Denver,CO

df = data.frame(lat=runif(10, 38,40), long=-runif(10, 104,106), 
                size=runif(10)*20, color=sample(rainbow(3), 10, replace=T),
                line=sample(1:3, 10,replace=T))

plot(OSMMap(df))

plot(OSMMap(df, size='size', color='color'))

linePlot = OSMMap(df, line='line')
plot(linePlot)

