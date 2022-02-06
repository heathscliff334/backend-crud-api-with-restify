const responseData = function(response, status, statusCode, metaData, values) {
    var data = {
        success: status,
        meta: metaData,
        data: values
    };
    response.send(statusCode, data)
};

const responseMessage = function(response, status, statusCode, message) {
    var data = {
        success: status,
        message: message
    };
    response.send(statusCode, data)
};

const responseError = function(response, status, statusCode, message, error) {
    var data = {
        success: status,
        message: message,
        error: error
    };
    response.send(statusCode, data)
}

module.exports = { responseData, responseMessage, responseError };