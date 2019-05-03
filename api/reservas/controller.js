const moment = require('moment');

const _getReservas = async (req, res, next, database, queries) => {

    const execute = database.execute;

    execute(queries.QReservasAll, []).then(results => {

            let data = [];
            if (results.length) {
                data = results.map((e) => toReservaInfo(e));
            }
            res.send(JSON.stringify(Object.assign( data)))
        }
    ).catch(error => {
        error.status = 500;
        next(error);
        return;
    });
};

const toReservaInfo = (e) => {
    return {
        booking_code: e.booking_code,
        pickup_timestamp: moment.unix(e.pickup_timestamp).format("DD/MM/YYYY"),
        last_name: e.last_name,
        first_name: e.first_name,
        payment_successful: e.payment_successful
    };
}
const getController = (libs, queries) => ({
    getReservas: (req, res, next) => _getReservas(req, res, next, libs.database, queries),
});

module.exports.getController = getController;