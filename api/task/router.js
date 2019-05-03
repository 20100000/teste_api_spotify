const express = require('express');
const Controller = require('./controller');
const queries = require('./queries');
const PATH = '/tasks';
const db = require('../../lib/database');


const router = express.Router();
const libs = {
    database: {
        execute: db.execute
    }
};

const controller = Controller.getController(libs, queries);

router.get('/list', controller.getTasks);
router.post('/', controller.addTask);
router.delete('/:id', controller.dellTask);
router.put('/:id', controller.editTask);

module.exports = { path: PATH, router };