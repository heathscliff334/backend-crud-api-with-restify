const conn = require('../config/database');

const {
    responseData,
    responseMessage,
    responseError
} = require('../utils/response-handler');

const { auth } = require('../middleware/auth');

exports.getChecklists = (request, response, statement, countStatement, data) => {
    const verif = auth(request, response);
    var total_data = 0;
    if (verif.verified) {
        conn.query(countStatement, data, (err, rows, field) => {
            if (err) {
                responseError(response, false, 500, 'Failed to get the data', err);
            }
            total_data = rows[0].total_data
        });
        conn.query(statement, data, (err, rows, field) => {
            if (err) {
                responseError(response, false, 500, 'Failed to get the data', err);
            }
            var metaData = { "count": rows.length, "total": total_data }
            responseData(response, true, 200, metaData, rows);
        });

    } else {
        responseMessage(response, false, verif.responseStats, verif.message);
    }
};
exports.getChecklistDetail = (request, response, statement, id, data) => {
    const verif = auth(request, response);
    if (verif.verified) {
        conn.query(statement, id, (err, rows, field) => {
            if (err) {
                responseError(response, false, 500, 'Failed to get the data', err);
            }
            var metaData
            var links = { "self": request.url }
            var data = { "type": "checklists", "id": rows[0].id, "attributes": rows, "links": links }
            responseData(response, true, 200, metaData, data);
        });

    } else {
        responseMessage(response, false, verif.responseStats, verif.message);
    }
};
exports.insertChecklists = (request, response, statement, data) => {
    const verif = auth(request, response);
    if (verif.verified) {
        conn.query(statement, data, (err, rows, field) => {
            if (err) {
                responseError(response, true, 500, 'Failed to insert the data', err);
            }
            responseMessage(response, true, 201, 'Succes to insert the data to tb_users');
        });
    } else {
        responseMessage(response, false, verif.responseStats, verif.message);
    }
};
exports.updateChecklists = (request, response, findIdStatement, updateStatement, id, data) => {
    const verif = auth(request, response);
    if (verif.verified) {
        conn.query(findIdStatement, id, (err, rows, field) => {
            if (err) {
                responseError(response, false, 500, 'Error to find the ID', err);
            }
            if (rows.length) {
                console.log('ID Found!');
                conn.query(updateStatement, [data, id], (err, rows, field) => {
                    if (err) {
                        responseError(response, false, 500, 'Failed to update the data', err);
                    }
                    responseMessage(response, true, 200, 'Success to update the data');

                });
            } else {
                console.log('ID Not Found!');
                responseMessage(response, false, 404, 'ID not found');
            }
        });
    } else {
        responseMessage(response, false, verif.responseStats, verif.message);
    }
};
exports.deleteChecklists = (request, response, findIdStatement, deleteStatement, id) => {
    const verif = auth(request, response);
    if (verif.verified) {
        conn.query(findIdStatement, id, (err, rows, field) => {
            if (err) {
                response.status(500).json({ message: 'Error to find the data ID', error: err });
            }
            if (rows.length) {
                conn.query(deleteStatement, id, (err, rows, field) => {
                    if (err) {
                        responseError(response, false, 500, 'Failed to delete the data', err);
                    }
                    responseMessage(response, true, 200, 'Deleted successfuly');
                });
            } else {
                responseMessage(response, false, 404, 'ID not found');
            }
        });
    } else {
        responseMessage(response, false, verif.responseStats, verif.message);
    }
};