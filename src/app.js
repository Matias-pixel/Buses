const express = require('express');
const { json } = require('express');
const path = require('path');

const app = express();

//Motor de plantillas
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname,'views'));

//Permitir ver imagenes 
app.use(express.static(path.join(__dirname,'public')));

app.use('/', require('./router'));

app.listen(5000, ()=>{
    console.log('Conectado a http://localhost:5000/');
});