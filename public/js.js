//const L = require('leaflet');
function Consulta(){
    console.log('hola mundo ')
    document.getElementById('parrafo').innerHTML = 'Parrafo nuevo';


}
var animateButton = function(e) {

    e.preventDefault;
    //reset animation
    e.target.classList.remove('animate');
    
    e.target.classList.add('animate');
    setTimeout(function(){
      e.target.classList.remove('animate');
    },700);
  };
  
  var bubblyButtons = document.getElementsByClassName("bubbly-button");
  
  for (var i = 0; i < bubblyButtons.length; i++) {
    bubblyButtons[i].addEventListener('click', animateButton, false);
  }

  var map = L.map('map').setView([-38.0022812, -57.5575409], 10);
    
    L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
	maxZoom: 20,
	attribution: '&copy; Openstreetmap France | &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    
    var point1 = {
        "type": "Point",
        "coordinates": [-38.07302305627273, -57.37611337325146]
    };
    var point2 = {
        "type": "Point",
        "coordinates": [-37.239601347108, -54.28511191750803]
    };
    var point3 = {
        "type": "Point",
        "coordinates": [-37.11960288547337, -50.32288635380249]
    };
    var puerto = { 
        "type": "Polygon",
        "coordinates": [[
            [-104.05, 48.99],
            [-97.22,  48.98],
            [-96.58,  45.94],
            [-104.03, 45.94],
            [-104.05, 48.99]
        ]]  
    };
    var myLines = [{
        "type": "LineString",
        "coordinates": [[-57.37611337325146, -38.07302305627273], [-54.28511191750803, -37.239601347108], [-50.32288635380249, -37.11960288547337],[-57.37611337325146, -38.07302305627273]]
        }];
    
    L.geoJSON(puerto).addTo(map);
    L.geoJSON(point1).addTo(map);
    L.geoJSON(point2).addTo(map);
    L.geoJSON(point3).addTo(map);
    L.geoJSON(myLines).addTo(map);




