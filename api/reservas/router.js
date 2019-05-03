const express = require('express');
const Controller = require('./controller');
const queries = require('./queries');
const PATH = '/reservas';
const db = require('../../lib/database');


const router = express.Router();
const libs = {
    database: {
        execute: db.execute
    }
};

const controller = Controller.getController(libs, queries);

router.get('/all', controller.getReservas);

module.exports = { path: PATH, router };