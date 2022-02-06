require("dotenv").config()

const restify = require('restify')
const bodyParser = require('body-parser');

const router = require('./routes/router')

const { API_PORT } = process.env

const app = restify.createServer()
app.use(restify.plugins.acceptParser(app.acceptable));
app.use(restify.plugins.queryParser());
app.use(restify.plugins.bodyParser());

const PORT = process.env.PORT || API_PORT;


router(app)

// For the server
app.listen(PORT, () => console.log('Server running at port : ' + PORT));