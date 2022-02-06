const { login } = require('../controllers/auth-controller');
const { getData, getDetail, createData, updateData, deleteData } = require('../controllers/checklists-controller');

const router = (app) => {
    app.post('/api/auth', login) // to get authorization token
    app.get('/api/checklists', getData)
    app.get('/api/checklists/:id', getDetail)
    app.post('/api/checklists', createData)
    app.patch('/api/checklists/:id', updateData)
    app.del('/api/checklists/:id', deleteData)
}
module.exports = router