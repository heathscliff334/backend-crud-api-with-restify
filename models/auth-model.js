require("dotenv").config()
const conn = require('../config/database');
const {
    responseData,
    responseMessage,
    responseError
} = require('../utils/response-handler');
const crypto = require('crypto');
const jwt = require("jsonwebtoken");
var SaltLength = 9;


function validateHash(hash, password) {
    var salt = hash.substr(0, 12); // Use length 12
    var validHash = salt + md5(password + salt);
    return hash === validHash;
}

function md5(string) {
    return crypto.createHash('md5').update(string).digest('hex');
}

// ? Exports is used because we can use this function in another class or file
exports.loginAuth = (response, statement, data) => {
    let tempId;
    var tempData = data;

    conn.query(statement, data.email, (err, rows, field) => {
        if (err) {
            responseError(response, 500, 'Login failed', err);
        } else if (rows.length) {
            var passwordCheck = validateHash(rows[0].password, data.password);
            if (passwordCheck) {
                if (rows[0].is_active == 1) {
                    var tempEmail = rows[0].email;
                    var tempUniqueId = rows[0].unique_id;
                    const token = jwt.sign({ unique_id: tempUniqueId, tempEmail }, process.env.TOKEN_KEY, { expiresIn: "120s" });
                    rows[0].token = token;
                    responseData(response, true, 201, rows);
                } else {
                    responseMessage(response, false, 200, 'Account is not active');
                }
            } else {
                responseMessage(response, false, 200, 'Wrong password');
            }
        } else {
            responseMessage(response, false, 200, 'Email not found');
        }
    });
};