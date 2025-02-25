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
    
map.on("contextmenu", function (event) {
    console.log("user right-clicked on map coordinates: " + event.latlng.toString());
    L.marker(event.latlng).addTo(map);
});

function consulta1() {
    fetch('/consultas/1')
        .then(response => {
            return response.json();
        })
        .then(data => {
            let message = '';
            data.forEach(row => {
                let date = Date(row.fecha);
                message += 'Banco: ' + row.id_banco_pesca + ' - Fecha: ' + date + ' - Barco: ' + row.id_barco + '<br>';
            });
            document.getElementById('parrafo').innerHTML = message;
        })
        .catch(error => {
            alert('Hubo un error al tratar de cumplir la petición.')
        });
}

function consulta2() {
    fetch('/consultas/2')
        .then(response => {
            return response.json();
        })
        .then(data => {
            document.getElementById('parrafo').innerHTML = data.result;
        })
        .catch(error => {
            alert('Hubo un error al tratar de cumplir la petición.')
        });
}

function consulta3() {
    fetch('/consultas/3')
        .then(response => {
            return response.json();
        })
        .then(data => {
            document.getElementById('parrafo').innerHTML = data.result;
        })
        .catch(error => {
            alert('Hubo un error al tratar de cumplir la petición.')
        });
}

function consulta4() {
    fetch('/consultas/4')
        .then(response => {
            return response.json();
        })
        .then(data => {
            let message = '';
            data.forEach(row => {
                message += 'Punto asociado: ' + row.id_punto + ' - Barco: ' + row.id_barco + ' - Derrotero: ' + row.id_derrotero + '<br>';
            });
            document.getElementById('parrafo').innerHTML = message;
        })
        .catch(error => {
            alert('Hubo un error al tratar de cumplir la petición.')
        });
}

function consulta5() {
    fetch('/consultas/5')
        .then(response => {
            return response.json();
        })
        .then(data => {
            document.getElementById('parrafo').innerHTML = data.result;
        })
        .catch(error => {
            alert('Hubo un error al tratar de cumplir la petición.')
        });
}

function consulta6() {
    fetch('/consultas/6')
        .then(response => {
            return response.json();
        })
        .then(data => {
            document.getElementById('parrafo').innerHTML = data.result;
        })
        .catch(error => {
            alert('Hubo un error al tratar de cumplir la petición.')
        });
}

function consulta7() {
    fetch('/consultas/7')
        .then(response => {
            return response.json();
        })
        .then(data => {
            let message = '';
            data.forEach(row => {
                message += 'Barco: ' + row.id_barco + '<br>';
            });
            document.getElementById('parrafo').innerHTML = message;
        })
        .catch(error => {
            alert('Hubo un error al tratar de cumplir la petición.')
        });
}

function consulta8() {
    fetch('/consultas/8')
        .then(response => {
            return response.json();
        })
        .then(data => {
            document.getElementById('parrafo').innerHTML = 'Empresa: ' + data.result;
        })
        .catch(error => {
            alert('Hubo un error al tratar de cumplir la petición.')
        });
}

function getPuertos() {
    fetch('/puertos')
        .then(response => {
            return response.json();
        })
        .then(data => {
            data.forEach(harbour => {
                L.geoJSON(JSON.parse(harbour.geo)).addTo(map);
            });
        })
        .catch(error => {
            console.log(error);
            alert('Hubo un error al tratar de cumplir la petición.')
        });
}

function getBancosPesca() {
    fetch('/bancospesca')
        .then(response => {
            return response.json();
        })
        .then(data => {
            data.forEach(bench => {
                L.geoJSON(JSON.parse(bench.geo)).addTo(map);
            });
        })
        .catch(error => {
            console.log(error);
            alert('Hubo un error al tratar de cumplir la petición.')
        });
};

function getTrayectosDerroteros() {
    fetch('/derroteros/trayectos')
        .then(response => {
            return response.json();
        })
        .then(data => {
            let options = {
                onEachFeature: function (feature, layer) {
                    layer.bindPopup('<h1>Derrotero:'+feature.properties['derrotero']+'</h1>');
                }
            };
            data.forEach(trajectory => {
                let gj = JSON.parse(trajectory.geo);
                gj.properties = {
                    "derrotero": trajectory.id_derrotero,
                };
                L.geoJSON(gj, options).addTo(map);
            });
        })
        .catch(error => {
            console.log(error);
            alert('Hubo un error al tratar de cumplir la petición.')
        });
};

function getTrayectosReales() {
    fetch('/mediciones/trayectos')
        .then(response => {
            return response.json();
        })
        .then(data => {
            let options = {
                color: "#008000",
                onEachFeature: function (feature, layer) {
                    layer.bindPopup('<h1>Trayecto:'+feature.properties['trayecto']+'</h1>');
                }
            };
            data.forEach(trajectory => {
                let gj = JSON.parse(trajectory.geo);
                gj.properties = {
                    "trayecto": trajectory.id_derrotero,
                };
                L.geoJSON(gj, options).addTo(map);
            });
        })
        .catch(error => {
            console.log(error);
            alert('Hubo un error al tratar de cumplir la petición.')
        });
};

getPuertos();
getBancosPesca();
getTrayectosDerroteros();
getTrayectosReales();