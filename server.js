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
        })
    });

    app.listen(app.get('port'), () => {
        console.log(app.get('host'));
        console.log('Server listen on port', app.get('port'));
    });
};