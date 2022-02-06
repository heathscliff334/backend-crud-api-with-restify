const mysql = require('mysql');

// configure connection
const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'db_test_ski',
    multipleStatements: true
});

// database connections
conn.connect((err) => {
    if (err) throw err;
    console.log('MySQL Connected');
});
module.exports = conn;