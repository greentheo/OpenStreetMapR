//some javascript to load up on a page if you are using something like opencpu

leafletMap = function(injectDiv, geoJSon, mapID){
  console.log(injectDiv);
  
    var geoJSONSetOSMMapID = geoJSon;
    
    var title='A Title';
    var subTitle = 'SubTitle';
    var desc = 'Desc';
    
    //var legendJSON = theRgeneratedLegendJSON;
    
    //var titleJSON = theRgeneratedTitleJSON;
    var mapOSMMapID;
  	// set up the map
		mapOSMMapID = new L.Map(mapID, scrollWheelZooom=false);
		var ajaxRequestOSMMapID;
		var plotlistOSMMapID;
		var plotlayersOSMMapID=[];
    
    var loadedOSMMapID = false;
		

    //rolloverBox for information
    var rolloverBoxOSMMapID = L.control({position: 'bottomleft'});

    rolloverBoxOSMMapID.onAdd = function (map) {
        this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
        this.update("<h4>Map Information</h4>");
        return this._div;
    };
    // method that we will use to update the control based on feature properties passed
    rolloverBoxOSMMapID.update = function (props) {
      this._div.innerHTML = props;
    };
    rolloverBoxOSMMapID.addTo(mapOSMMapID);
	

		$(document).ready(function(){
			injectDiv.height($(window).height()*.5);
      //attention here ****
	  		injectDiv.width(document.getElementById(mapID).parentNode.offsetWidth-40);
			initmapOSMMapID();
		});

		$(window).resize(function(){
		injectDiv.val('');
			injectDiv.height($(window).height()*.5);
      //attention here******
	  		injectDiv.width(document.getElementById(mapID).parentNode.offsetWidth-40);
			
		});
       
    
    window.setTimeout(function(){
      if(!loadedOSMMapID){
        initmapOSMMapID();
      }
    }, 1000);
  
}
 function highlightFeatureOSMMapID(e) {
      var layer = e.target;

      layer.setStyle({
          weight: 5,
          color: '#666',
          dashArray: '',
          fillOpacity: 0.7
      });
  
      if (!L.Browser.ie && !L.Browser.opera) {
          layer.bringToFront();
      }
      //set the text in the rolloverBox
     rolloverBoxOSMMapID.update(layer.feature.properties.popupContent);
    }
    function resetHighlight(e) {
      var layer = e.target;
      layer.setStyle({
          color: e.target.feature.properties.color,
          opacity: .6,
          fillOpacity: .5,
          weight: 5
      });
    }
    function zoomToFeatureOSMMapID(e) {
        mapOSMMapID.fitBounds(e.target.getBounds());
        //set the text in the rolloverBox
        rolloverBox.update(layer.feature.properties.popupContent);
    }
  	function initmapOSMMapID() {
		
      
			// create the tile layer with correct attribution
			var osmUrl='http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
			var osmAttrib='Map data © OpenStreetMap contributors';
			var osm = new L.TileLayer(osmUrl, {minZoom: 0, maxZoom: 19, attribution: osmAttrib});		

			baseLayer = {
 				"Base": osm
 			}
			// start the map in South-East England
			mapOSMMapID.setView(new L.LatLng(mapCenterLat, mapCenterLong), mapZoomLevel);
			mapOSMMapID.addLayer(osm);	

			var layers={};
			$.each(geoJSONSetOSMMapID, function(i, item){
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
                 if(feature.properties.static=="false"){
                  layer.on({
                  mouseover: highlightFeatureOSMMapID,
                  mouseout: resetHighlight,
                  click: zoomToFeatureOSMMapID 
                })
                }
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

        info.addTo(mapOSMMapID);
        
			//add the layers to the map
			layerControl = 	L.control.layers(baseLayer, layers, {
 				collapsed: false
 			});
 			layerControl.addTo(mapOSMMapID);
 			$.each(layers, function(i, item){
  				mapOSMMapID.addLayer(item);
  			});
 			L.control.scale().addTo(mapOSMMapID);
			
      loadedOSMMapID = true;
      console.log('Map has been initialized')
		}