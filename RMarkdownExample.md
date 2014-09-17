


Test Plots with RMarkdown and OpenStreetMapR
========================================================

Open StreetMapR is designes to work either interactively with plots or interactively within an RMarkdown document.  Reporting and reproducible research at it's best!

Let's take a look at a dataset.


```r
library(OpenStreetMapR)
df = data.frame(lat=runif(100, 38,40), long=-runif(100, 104,106), 
                size=runif(100)*20, color=sample(rainbow(10), 100, replace=T))

head(df)
```

```
##     lat   long   size     color
## 1 39.73 -105.2 18.995 #CCFF00FF
## 2 39.41 -105.2 16.393 #FF9900FF
## 3 38.09 -105.7  2.769 #33FF00FF
## 4 38.89 -105.2 12.113 #00FFFFFF
## 5 39.61 -105.6 15.011 #CCFF00FF
## 6 38.07 -104.2 18.046 #FF0000FF
```

You can plot this in a window easily with


```r
#plot(OSMMap(df)
#plot(OSMMap(df, size='size', color='color'))
```


But you can also include this data as part of your RMarkdown just as easily, just print the OSMap object and make sure to turn off echo and results="asis"



```r
(print(OSMMap(df, size='size', color='color')))
```

```
## Warning: incomplete final line found on
## '/home/Rlib/OpenStreetMapR/OSMPrintBrew.brew.html'
```

	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.css" />
 
   <script src="http://cdn.leafletjs.com/leaflet-0.6.4/leaflet.js"></script>
 
 	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
 	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
 
 <style>
    .legend {
       line-height: 18px;
       color: #555;
   }
   .legend i {
       width: 18px;
       height: 18px;
       float: left;
       margin-right: 8px;
       opacity: 0.7;
   }
   .info {
       padding: 6px 8px;
       font: 14px/16px Arial, Helvetica, sans-serif;
       background: white;
       background: rgba(255,255,255,0.8);
       box-shadow: 0 0 15px rgba(0,0,0,0.2);
       border-radius: 5px;
   }
   .info h4 {
       margin: 0 0 5px;
       color: #777;
   }
 </style>
 
 	<div id='OSMMap4246'></div>
 
 
 	<script>
 
 		var geoJSONSet = [
 {
 "layer": "layer1",
"data": {
 "type": "FeatureCollection",
"features": [
 {
 "geometry": {
 "type": "Point",
"coordinates": [ -104.81, 39.821 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 18.995 
},
"id": 1 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.98, 38.112 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 16.393 
},
"id": 2 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.23, 38.535 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 2.7686 
},
"id": 3 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.73,  38.31 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 12.113 
},
"id": 4 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.65, 38.641 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 15.011 
},
"id": 5 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.98, 38.104 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 18.046 
},
"id": 6 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.25,   39.4 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 6.9844 
},
"id": 7 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.01, 38.174 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 14.984 
},
"id": 8 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.35, 38.357 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 7.3572 
},
"id": 9 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.53,  39.87 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 3.4034 
},
"id": 10 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.92, 38.837 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 15.515 
},
"id": 11 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.14,  38.32 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#0066FF",
"size": 12.874 
},
"id": 12 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.81, 39.786 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 9.3103 
},
"id": 13 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.46, 39.153 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 17.422 
},
"id": 14 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.7, 38.612 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 19.138 
},
"id": 15 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.98, 39.351 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 12.369 
},
"id": 16 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.19, 39.079 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 13.044 
},
"id": 17 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.65, 38.028 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 14.867 
},
"id": 18 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.95, 38.282 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 16.539 
},
"id": 19 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.18,  38.42 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 6.4006 
},
"id": 20 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.37, 39.113 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CC00FF",
"size": 11.242 
},
"id": 21 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.16, 39.753 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 18.076 
},
"id": 22 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.9, 38.211 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 0.37986 
},
"id": 23 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.15,  38.89 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 2.5938 
},
"id": 24 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.12,  39.94 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 15.038 
},
"id": 25 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.43,  39.52 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#33FF00",
"size": 18.281 
},
"id": 26 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.25, 39.364 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 17.736 
},
"id": 27 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.84, 39.205 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 3.7057 
},
"id": 28 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.46,  39.52 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 10.653 
},
"id": 29 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.36, 39.223 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 9.0309 
},
"id": 30 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.47, 38.542 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 6.9074 
},
"id": 31 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.57, 39.237 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size":  13.53 
},
"id": 32 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.63, 39.199 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0099",
"size": 0.49719 
},
"id": 33 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.66, 38.089 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 17.849 
},
"id": 34 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.71,  39.05 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 0.1933 
},
"id": 35 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.11, 39.139 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 2.8886 
},
"id": 36 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.95,  39.88 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 12.807 
},
"id": 37 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.31, 38.622 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 12.222 
},
"id": 38 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.88, 39.728 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 0.34628 
},
"id": 39 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.11, 38.708 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 12.761 
},
"id": 40 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.37, 38.344 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 17.402 
},
"id": 41 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.45, 39.209 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 14.904 
},
"id": 42 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.07,  39.12 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 14.035 
},
"id": 43 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.96, 38.964 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 0.84939 
},
"id": 44 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.62,  38.47 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 16.516 
},
"id": 45 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.49, 38.948 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#CCFF00",
"size": 7.2418 
},
"id": 46 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.55, 38.038 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 8.2719 
},
"id": 47 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.33, 38.685 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 9.4692 
},
"id": 48 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.08, 39.408 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 2.4437 
},
"id": 49 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.7, 39.801 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 16.761 
},
"id": 50 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.2, 39.833 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 0.88426 
},
"id": 51 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.51, 38.786 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 7.7507 
},
"id": 52 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.56, 39.567 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 0.6693 
},
"id": 53 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.84, 38.659 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 2.1494 
},
"id": 54 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.22, 39.914 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 17.498 
},
"id": 55 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.63, 39.455 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 0.13571 
},
"id": 56 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.52, 38.673 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 8.7917 
},
"id": 57 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.51, 38.968 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 8.5022 
},
"id": 58 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.98, 39.054 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 15.578 
},
"id": 59 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.31, 38.097 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#3300FF",
"size": 9.8627 
},
"id": 60 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.16, 39.726 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size": 17.396 
},
"id": 61 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.24, 39.119 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size": 12.666 
},
"id": 62 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.06,  38.76 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size":  5.645 
},
"id": 63 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.43, 39.292 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size": 13.543 
},
"id": 64 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.63, 39.608 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size": 11.619 
},
"id": 65 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.67, 39.257 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size": 15.248 
},
"id": 66 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.28,  38.35 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size": 6.3385 
},
"id": 67 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.84, 39.169 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size": 3.9329 
},
"id": 68 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.16, 38.308 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF0000",
"size": 4.9603 
},
"id": 69 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.07, 39.315 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 8.3663 
},
"id": 70 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.93, 38.251 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size":  9.277 
},
"id": 71 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.21, 38.073 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 14.316 
},
"id": 72 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.4, 38.324 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 0.19108 
},
"id": 73 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.83, 38.234 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 4.1917 
},
"id": 74 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.44, 38.524 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 4.7688 
},
"id": 75 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.4, 38.644 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 19.141 
},
"id": 76 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.09, 39.509 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FF66",
"size": 12.987 
},
"id": 77 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.56, 38.935 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 10.483 
},
"id": 78 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.7, 38.609 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 9.0078 
},
"id": 79 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.95, 39.319 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 6.4964 
},
"id": 80 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.18,  39.45 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 15.048 
},
"id": 81 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.22,  39.19 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 19.531 
},
"id": 82 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.39, 38.907 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 9.8584 
},
"id": 83 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.58, 38.226 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 2.9275 
},
"id": 84 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.18, 39.254 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 3.6328 
},
"id": 85 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.9, 38.723 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 13.252 
},
"id": 86 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.04, 39.532 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 11.336 
},
"id": 87 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.3, 39.645 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 6.4357 
},
"id": 88 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.09,  39.16 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 8.6664 
},
"id": 89 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.56, 38.886 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 11.331 
},
"id": 90 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.92, 38.498 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#00FFFF",
"size": 15.938 
},
"id": 91 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.66, 38.192 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 2.2351 
},
"id": 92 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.23, 39.413 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 14.605 
},
"id": 93 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.41, 38.357 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 7.7831 
},
"id": 94 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.7,  38.43 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 9.7645 
},
"id": 95 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.33, 39.149 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 5.9024 
},
"id": 96 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.86, 38.193 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 4.7649 
},
"id": 97 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.28, 39.938 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size":  8.229 
},
"id": 98 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -105.45, 39.729 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 11.889 
},
"id": 99 
},
{
 "geometry": {
 "type": "Point",
"coordinates": [ -104.42, 38.611 ] 
},
"type": "Feature",
"properties": {
 "popupContent": "",
"color": "#FF9900",
"size": 15.175 
},
"id": 100 
} 
] 
} 
} 
];
     
     var title='OpenStreetMapR';
     var subTitle = '<a href="https://github.com/greentheo/OpenStreetMapR/">Github Link</a>';
     var desc = '';
     
     //var legendJSON = theRgeneratedLegendJSON;
     
     //var titleJSON = theOpenStreetMapRJSON;
     
 		var map;
 		// set up the map
 		map = new L.Map('OSMMap4246', scrollWheelZooom=false);
 		var ajaxRequest;
 		var plotlist;
 		var plotlayers=[];
 
 		var mapID="#OSMMap4246";
 
 		$(document).ready(function(){
 			$('#OSMMap4246').height($(window).height()*.5);
 	  		$('#OSMMap4246').width($(window).width()-20);
 			initmap();
 		});
 
 		$(window).resize(function(){
 			$('#OSMMap4246').val('');
 			$('#OSMMap4246').height($(window).height()*.5);
 	  		$('#OSMMap4246').width($(window).width()-20);
 			
 		});
 		function initmap() {
 			
 
 			// create the tile layer with correct attribution
 			var osmUrl='http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
 			var osmAttrib='Map data © OpenStreetMap contributors';
 			var osm = new L.TileLayer(osmUrl, {minZoom: 0, maxZoom: 19, attribution: osmAttrib});		
 
 			baseLayer = {
  				"Base": osm
  			}
 			// start the map in South-East England
 			map.setView(new L.LatLng(38.9492256233329, -104.975761210709), 8);
 			map.addLayer(osm);	
 
 			var layers={};
 			$.each(geoJSONSet, function(i, item){
  				//add the geo points
  				switch(item.data.features[0].geometry.type){
  					case "Point":
 		 				layers[item.layer]=L.geoJson(item.data, { 
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
 		 					});
 		 			break;
 		 			case "LineString": 
   	 				layers[item.layer]=L.geoJson(item.data, { 
 	 						onEachFeature: function(feature, layer){
 								return L.polyline(feature.geometry.coordinates, {
 							});	
 		 					},
               style: function(feature){
                 return {color: feature.properties.color,
                         opacity: .75,
                         fillOpacity: .75};
               }  				
 		 				});			
 		 			break;	
           case "Polygon": 
   	 				layers[item.layer]=L.geoJson(item.data, { 
 	 						onEachFeature: function(feature, layer){
 								return L.polygon(feature.geometry.coordinates, {
 								
 							});	
 		 					},
               style: function(feature){
                 return {color: feature.properties.color,
                         opacity: .6,
                         fillOpacity: .5};
               }  				
 		 				});			
 		 			break;
 		 		}	
  			});
        
          //Add a title box
         var info = L.control({position: 'topright'});
 
         info.onAdd = function (map) {
             this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
             this.update();
             return this._div;
         };
 
         // method that we will use to update the control based on feature properties passed
         info.update = function (props) {
             this._div.innerHTML = '<h3>'+title+'</h3><h4>'+subTitle+'</h4><p>'+desc+'</p>'
         };
 
         info.addTo(map);
         
 			//add the layers to the map
 			layerControl = 	L.control.layers(baseLayer, layers, {
  				collapsed: false
  			});
  			layerControl.addTo(map);
  			$.each(layers, function(i, item){
   				map.addLayer(item);
   			});
  			L.control.scale().addTo(map);
 			
 		}
 
 	</script>
NULL
