const express = require('express');
const app = express();

app.set('host', 'localhost:5000');
app.set('port', 5000);

app.use(express.static('public'))

app.listen(app.get('port'), () => {

    console.log(app.get('host'));
    console.log('Server listen on port',app.get('port'));
});