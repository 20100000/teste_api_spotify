const express = require('express');
const Controller = require('./controller');
const PATH = '/temperatura';


const router = express.Router();
const libs = {

};

const controller = Controller.getController(libs);

router.get('/', controller.getTemperatura);

module.exports = { path: PATH, router };