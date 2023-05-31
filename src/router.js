const express = require('express');
const router =  express.Router();
const conexion = require('./database/db');

router.get('/', (req,res)=>{
    res.render('login');
});

router.get('/index', (req,res)=>{
    res.render('index');
});

router.get('/registro', (req,res)=>{
    res.render('registro');
});






module.exports = router;