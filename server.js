const express = require('express');

module.exports.startServer = (host, port, db) => {
    const app = express();

    app.set('host', host);
    app.set('port', port);

    app.use(express.static('public'));

    app.get('/consultas/1', (req, res) => {
        db.query('SELECT * FROM informe_bancos_pesca', (error, results) => {
            if (error) throw error;
            res.json(results);
        });
    });

    app.get('/consultas/2', (req, res) => {
        db.query('SELECT barcos_fuera_puerto()', (error, results) => {
            if (error) throw error;
            var content = {'result': (results[0])['barcos_fuera_puerto()']};
            res.json(content);
        });
    });

    app.get('/consultas/3', (req, res) => {
        db.query('SELECT cantidad_barcos_tiempo_desviado()', (error, results) => {
            if (error) throw error;
            var content = {'result': (results[0])['cantidad_barcos_tiempo_desviado()']};
            res.json(content);
        });
    });

    app.get('/consultas/4', (req, res) => {
        db.query('SELECT * FROM punto_salteado', (error, results) => {
            if (error) throw error;
            res.json(results);
        });
    });

    app.get('/consultas/5', (req, res) => {
        db.query('SELECT llegaron_mdq()', (error, results) => {
            if (error) throw error;
            var content = {'result': (results[0])['llegaron_mdq()']};
            res.json(content);
        });
    });

    app.get('/consultas/6', (req, res) => {
        db.query('SELECT barcos_latitud_33()', (error, results) => {
            if (error) throw error;
            var content = {'result': (results[0])['barcos_latitud_33()']};
            res.json(content);
        });
    });

    app.get('/consultas/7', (req, res) => {
        db.query('SELECT * FROM barcos_consumo_excesivo', (error, results) => {
            if (error) throw error;
            res.json(results);
        });
    });

    app.get('/consultas/8', (req, res) => {
        db.query('SELECT empresa_mas_merluza()', (error, results) => {
            if (error) throw error;
            var content = {'result': (results[0])['empresa_mas_merluza()']};
            res.json(content);
        });
    });

    app.get('/puertos', (req, res) => {
        db.query('SELECT ST_AsGeoJSON(region) AS geo FROM puerto', (error, results) => {
            if (error) throw error;
            res.json(results);
        });
    });

    app.get('/bancospesca', (req, res) => {
        db.query('SELECT ST_AsGeoJSON(region) AS geo FROM banco_pesca', (error, results) => {
            if (error) throw error;
            res.json(results);
        });
    });

    app.get('/derroteros/trayectos', (req, res) => {
        db.query('SELECT id_derrotero, ST_AsGeoJSON(linea) AS geo FROM trayecto_derrotero', (error, results) => {
            if (error) throw error;
            res.json(results);
        });
    });

    app.get('/mediciones/trayectos', (req, res) => {
        db.query('SELECT id_derrotero, ST_AsGeoJSON(linea) AS geo FROM trayecto_real', (error, results) => {
            if (error) throw error;
            res.json(results);
        });
    });

    app.listen(app.get('port'), () => {
        console.log(app.get('host'));
        console.log('Server listen on port', app.get('port'));
    });
};