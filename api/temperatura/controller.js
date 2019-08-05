
const _getTemperatura = async (req, res, next) => {

    console.log('aquiiiii_temperatura')
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
    getTemperatura: (req, res, next) => _getTemperatura(req, res, next),
});

module.exports.getController = getController;