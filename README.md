OpenStreetMapR
==============

Utility to plot points on an OpenStreetMap with R providing a dynamic and interactive Geo Mapping experience.

Instalation
-------------

OpenStreetMapR is a free and open source package for R providing an interactive mapping experience with Open Street Maps and Leaflet.js.  You can install it from R with the following:

 
```R
library(devtools)
install_github('OpenStreetMapR', 'greentheo')
```


Making Marker Plots
-------------------

To get started using OpenStreetMapR, simply create a data frame and use the plot funcitonality

```R
df = data.frame(lat=runif(100, 38,40), long=-runif(100, 104,106), 
                size=runif(100)*20, color=sample(rainbow(10), 100, replace=T))
OSMMap(df)
OSMMap(df, size='size', color='color')
```

You can also include the plots as part of R HTML and knitr with the following:

```HTML <!--begin.rcode results='asis'
(print(OSMMap(df, size='size', color='color')))
end.rcode-->
```
 
