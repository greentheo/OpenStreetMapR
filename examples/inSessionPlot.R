#plot earthquake data

#generate rand lats and longs near Denver,CO

df = data.frame(lat=runif(100, 38,40), long=-runif(100, 104,106), 
                size=runif(100)*20, color=sample(rainbow(10), 100, replace=T))

OSMMap(df)

OSMMap(df, size='size', color='color')

