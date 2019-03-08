const _getTasks = async (req, res, next, database, queries) => {

    const execute = database.execute;

    execute(queries.QTasksList, []).then(results => {

            let data = [];
            if (results.length) {
                data = results.map((e) => toTaskInfo(e));
            }
            res.send(JSON.stringify({data, success: true}))
        }
    ).catch(error => {
        error.status = 500;
        next(error);
        return;
    });
};

const _addTask = async (req, res, next, database, queries) => {
    const payload = req.body;
    const execute = database.execute;
    execute(queries.QAddTask, [payload.title, 'tess', '2019-03-08T03:00:00.000Z']).then(results => {

            res.send(JSON.stringify({data:results, success: true}))
        }
    ).catch(error => {
        error.status = 500;
        next(error);
        return;
    });
};

const _dellTask = async (req, res, next, database, queries) => {

    const execute = database.execute;
    const id = parseInt(req.params.id);
    execute(queries.QDellTask, [id]).then(results => {
            res.send(JSON.stringify({data: results, success: true}))
        }
    ).catch(error => {
        error.status = 500;
        next(error);
        return;
    });
};

const _editTask = async (req, res, next, database, queries) => {

    const execute = database.execute;
    const payload = req.body;
    const id = parseInt(req.params.id);
    execute(queries.QEditTask, [payload.title, id]).then(results => {
            res.send(JSON.stringify({data:results, success: true}))
        }
    ).catch(error => {
        error.status = 500;
        next(error);
        return;
    });
};

const toTaskInfo = (e) => {
    return {
        id: e.id,
        title: e.title,
        description: e.description,
        create: e.create
    };
};

const getController = (libs, queries) => ({
    getTasks: (req, res, next) => _getTasks(req, res, next, libs.database, queries),
    editTask: (req, res, next) => _editTask(req, res, next, libs.database, queries),
    addTask: (req, res, next) => _addTask(req, res, next, libs.database, queries),
    dellTask: (req, res, next) => _dellTask(req, res, next, libs.database, queries)
});

module.exports.getController = getController;