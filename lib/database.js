const mysql = require('mysql');

const databaseConfig = {
    host: '127.0.0.1',
    user: 'root',
    password: '',
    database: 'test',
    connectionLimit: 200,
    debug: false
};

const source = mysql.createPool(databaseConfig);

const execute = (query, params, isReadOnly) => {
    return new Promise((resolve, reject) => {
        source.getConnection((err, connection) => {
            if (err) { return reject(err); }
            connection.query(query, params, (error, results) => {
                connection.release();
                if (error) {
                    return reject(error);
                }
                return resolve(results);
            });
        });
    });
};

const createConnection = (isReadOnly) => {
    return new Promise((resolve, reject) => {
        source.getConnection((err, conn) => {
            if (err) {
                return reject(err);
            }
            return resolve(conn);
        });
    });
};

module.exports.execute = execute;
module.exports.getConnection = createConnection;