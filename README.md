OpenStreetMapR
==============

Utility to plot points on an OpenStreetMap with R providing a dynamic and interactive Geo Mapping experience.

Installation
-------------

OpenStreetMapR is a free and open source package for R providing an interactive mapping experience with Open Street Maps and Leaflet.js.  You can install it from R with the following:

 
```javascript
library(devtools)
install_github('OpenStreetMapR', 'greentheo')
```


Making Marker Plots
-------------------

To get started using OpenStreetMapR, simply create a data frame and use the plot funcitonality

```javascript
df = data.frame(lat=runif(10, 38,40), long=-runif(10, 104,106), 
                size=runif(10)*20, color=sample(rainbow(3), 10, replace=TRUE),
                line=sample(1:3, 10,replace=TRUE))
OSMMap(df)
OSMMap(df, size='size', color='color')
```

Creating a layered Map
----------------------

And the best part is, you can overlay different groups of layers and markers.  Open Street Map and Leaflet provide functionality to 
turn the layers on and off.

```javascript
dualMap = (addLayers(OSMMap(df, size='size', color='color'),
                       linePlot))
plot(dualMap)
```

Including in Markdown or RHtml
-------------------------------
You can also include the plots as part of R HTML and knitr with the following:

``` html
<!--begin.rcode results='asis'
(print(OSMMap(df, size='size', color='color')))
end.rcode-->
```
 
For more usage examples see 'package/inst/examples/'  or take a look at this page http://greentheo.github.io/openstreetmapr .

