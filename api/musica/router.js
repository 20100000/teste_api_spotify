const express = require('express');
const Controller = require('./controller');
const PATH = '/musica';


const router = express.Router();
const libs = {

};

const controller = Controller.getController(libs);

router.get('/:city', controller.getMusicas);

module.exports = { path: PATH, router };