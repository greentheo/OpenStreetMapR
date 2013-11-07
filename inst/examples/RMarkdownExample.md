
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.css" />

	<script src="http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.js"></script>

	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


Test Plots with RMarkdown and OpenStreetMapR
========================================================

Open StreetMapR is designes to work either interactively with plots or interactively within an RMarkdown document.  Reporting and reproducible research at it's best!

Let's take a look at a dataset.


```r
library(OpenStreetMapR)
```

```
## Loading required package: RJSONIO
```

```r
df = data.frame(lat = runif(100, 38, 40), long = -runif(100, 104, 106), size = runif(100) * 
    20, color = sample(rainbow(10), 100, replace = T))

head(df)
```

```
##     lat   long   size     color
## 1 39.71 -104.2  4.412 #CC00FFFF
## 2 39.54 -104.3 10.766 #3300FFFF
## 3 39.04 -104.4  1.994 #CC00FFFF
## 4 39.71 -105.0 11.779 #33FF00FF
## 5 39.17 -105.1  2.329 #FF0000FF
## 6 38.44 -105.9 16.948 #CC00FFFF
```


You can plot this in a window easily with


```r
# plot(OSMMap(df) plot(OSMMap(df, size='size', color='color'))
```



But you can also include this data as part of your RMarkdown just as easily, just print the OSMap object and make sure to turn on: .

	
 
 
 	<div id="OSMMap7306"></div>
 
 
 	<script>
 
 
 
 		var geoJSONSet = {
 "type": "FeatureCollection",
"features": [
 {
 "geometry": {
 "type": "Point",
"coordinates": [ -104.21, 39.706 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 4.4124 
},
"id": 1 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.28, 39.542 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 10.766 
},
"id": 2 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.36,  39.04 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 1.9938 
},
"id": 3 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.98, 39.714 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 11.779 
},
"id": 4 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.09, 39.172 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size":  2.329 
},
"id": 5 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.89, 38.441 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 16.948 
},
"id": 6 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.87, 38.723 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 16.489 
},
"id": 7 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.42, 39.938 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 15.467 
},
"id": 8 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.5, 38.118 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 14.097 
},
"id": 9 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.37, 38.007 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size":  1.053 
},
"id": 10 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.37, 38.747 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 3.5807 
},
"id": 11 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.32, 38.275 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 19.142 
},
"id": 12 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.74, 38.053 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 2.9733 
},
"id": 13 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.32, 39.787 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size":  11.19 
},
"id": 14 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.39,  38.31 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 14.619 
},
"id": 15 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.91, 38.583 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 17.277 
},
"id": 16 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.95, 39.925 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 2.6106 
},
"id": 17 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.83, 38.406 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 0.12616 
},
"id": 18 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.03,  39.92 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 6.7807 
},
"id": 19 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.29, 39.886 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 14.925 
},
"id": 20 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.81, 39.957 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 16.858 
},
"id": 21 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.53, 39.247 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 4.8071 
},
"id": 22 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.72,  38.48 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 6.9273 
},
"id": 23 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.21, 39.206 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 0.41958 
},
"id": 24 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.47, 38.041 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 1.9521 
},
"id": 25 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.41, 38.263 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 5.6504 
},
"id": 26 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.21, 38.912 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 17.499 
},
"id": 27 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.43, 38.068 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 6.1368 
},
"id": 28 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [   -104, 38.983 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 17.402 
},
"id": 29 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.78, 39.918 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 14.494 
},
"id": 30 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.44, 39.747 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 5.6126 
},
"id": 31 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.08, 39.971 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 3.4503 
},
"id": 32 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.03, 39.753 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size":  10.59 
},
"id": 33 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.85, 38.976 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 10.653 
},
"id": 34 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.19,  38.04 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 3.6811 
},
"id": 35 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.18, 38.274 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 14.337 
},
"id": 36 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.47, 38.469 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 5.4958 
},
"id": 37 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.51, 39.165 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 19.527 
},
"id": 38 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.57,  39.26 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 5.7948 
},
"id": 39 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.66, 39.802 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size": 9.6836 
},
"id": 40 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.7,  38.02 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 15.907 
},
"id": 41 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.85, 38.372 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size":  19.97 
},
"id": 42 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.12, 39.386 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 9.7409 
},
"id": 43 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.35, 38.934 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 13.822 
},
"id": 44 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.26, 38.688 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 14.087 
},
"id": 45 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.63, 38.949 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 18.442 
},
"id": 46 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.98,  38.86 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 4.9713 
},
"id": 47 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.84, 39.954 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 17.269 
},
"id": 48 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.87, 39.373 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 0.88043 
},
"id": 49 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.82,  38.62 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 10.965 
},
"id": 50 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.28, 38.018 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size":  2.968 
},
"id": 51 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [   -104, 38.797 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 5.4728 
},
"id": 52 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.23, 39.962 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 17.078 
},
"id": 53 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.4, 38.884 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 2.4924 
},
"id": 54 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.48,  38.77 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 4.3685 
},
"id": 55 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [   -105, 38.307 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 13.717 
},
"id": 56 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.16, 39.166 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 16.147 
},
"id": 57 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.47, 39.257 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 5.5511 
},
"id": 58 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.08, 39.305 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 13.078 
},
"id": 59 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.13, 38.464 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 15.077 
},
"id": 60 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.12, 38.261 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 13.751 
},
"id": 61 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.75,  38.57 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 16.557 
},
"id": 62 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.83, 39.723 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 4.4701 
},
"id": 63 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.55,  39.61 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 13.362 
},
"id": 64 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.13, 39.449 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 10.407 
},
"id": 65 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.06, 38.198 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 8.6652 
},
"id": 66 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.05, 38.865 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 17.125 
},
"id": 67 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.65,  38.47 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 4.5113 
},
"id": 68 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.89, 38.368 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 3.2506 
},
"id": 69 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.22, 38.654 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 0.43254 
},
"id": 70 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.36, 39.038 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 6.8112 
},
"id": 71 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.64, 39.358 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 2.3997 
},
"id": 72 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.26, 38.353 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 12.914 
},
"id": 73 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.05, 38.104 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 18.855 
},
"id": 74 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.27, 38.989 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 3.5834 
},
"id": 75 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.89, 38.162 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 4.8169 
},
"id": 76 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.33, 39.488 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 19.425 
},
"id": 77 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.2,  39.76 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 11.979 
},
"id": 78 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.93, 38.978 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size": 15.591 
},
"id": 79 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.51, 38.134 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 13.667 
},
"id": 80 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.53, 39.362 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 8.6491 
},
"id": 81 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.85, 38.654 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size":  9.763 
},
"id": 82 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.9, 39.015 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 0.14712 
},
"id": 83 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.56, 38.445 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size":   4.14 
},
"id": 84 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.11, 38.677 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 11.892 
},
"id": 85 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.62,  39.07 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 5.7267 
},
"id": 86 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.71, 38.324 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 17.972 
},
"id": 87 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.93, 39.692 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 0.81179 
},
"id": 88 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.01,  38.72 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 10.986 
},
"id": 89 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.55, 38.868 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 2.9798 
},
"id": 90 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.73, 39.191 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 1.3274 
},
"id": 91 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.49, 39.193 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 16.003 
},
"id": 92 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.18, 39.341 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 15.311 
},
"id": 93 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.88,  39.96 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size":  2.656 
},
"id": 94 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.36, 39.716 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 0.84592 
},
"id": 95 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.19, 38.289 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 19.478 
},
"id": 96 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.02, 38.541 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 14.734 
},
"id": 97 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.18, 39.384 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 8.8488 
},
"id": 98 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.6, 38.848 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 15.892 
},
"id": 99 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.81, 39.189 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 13.174 
},
"id": 100 
} 
] 
};
 
 		var map;
 		var ajaxRequest;
 		var plotlist;
 		var plotlayers=[];
 		var mapID="#OSMMap7306";
 
 		$(document).ready(function(){
 			$(mapID).height($(window).height()-20);
 	  		$(mapID).width($(window).width()-20);
 			initmap();
 		});
 
 		$(window).resize(function(){
 			$(mapID).val('');
 			$(mapID).height($(window).height()-20);
 	  		$(mapID).width($(window).width()-20);
 			initmap();
 		});
 		function initmap() {
 			// set up the map
 			map = new L.Map('OSMMap7306');
 
 			// create the tile layer with correct attribution
 			var osmUrl='http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
 			var osmAttrib='Map data © OpenStreetMap contributors';
 			var osm = new L.TileLayer(osmUrl, {minZoom: 0, maxZoom: 19, attribution: osmAttrib});		
 
 			// start the map in South-East England
 			map.setView(new L.LatLng(38.9591805867199, -104.902355195037), 8);
 			map.addLayer(osm);	
 
 			//add the geo points
 			L.geoJson(geoJSONSet, {
 				pointToLayer: function(feature, latlng){
 					return L.circleMarker(latlng, {
 					radius: feature.properties.size,
 					fillColor: feature.properties.color,
 					color: "#000",
 					weight: 1,
 					opacity: 1,
 					fillOpacity: 0.8
 				}).bindPopup(feature.properties.popupContent);
 
 				}
 
 			}).addTo(map);
 		}
 
 	</script>
NULL

