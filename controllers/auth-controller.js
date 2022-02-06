const {
    loginAuth,
} = require('../models/auth-model');

exports.login = (req, res) => {

    const query = 'SELECT * FROM tb_users WHERE email = ?';
    const data = {...req.body };
    loginAuth(res, query, data);
};