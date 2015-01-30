//A javascript file to accompany the html for the OpenCPU example

$(document).ready(function(){ 
  //when the document has loaded make the ocpu call, get the data and then print the map and inject it
  
  ocpu.call('randomData', {}, function(session){
    //call finished, pass the session into OSMMap
    ocpu.call('OSMMap', {df: session}, function(mapSession){
      //made the map, now print it and return the text
      ocpu.call('geoJSON', {OSMMap: mapSession},function(geoSession){
        geoSession.getObject(function(data){
          console.log(data);
          leafletMap(data.geoJSON, $('#theOSMContainer'), 'mainMap');
        });
      });
    });
  })

});

