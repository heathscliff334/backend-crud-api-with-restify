const {
    getChecklists,
    getChecklistDetail,
    insertChecklists,
    updateChecklists,
    deleteChecklists
} = require('../models/checklists-model');

exports.getData = (req, res) => {
    var queryParams = require('url').parse(req.url, true).query
    var query = ''
    var limit = queryParams.limit
    var offset = queryParams.offset
    var sort = queryParams.sort
    if (limit == null) {
        limit = 100
    }
    if (offset == null) {
        offset = 0
    }
    if (sort == null)[
        sort = 'asc'
    ]
    query = 'SELECT * FROM tb_checklists ORDER BY id ' + sort + ' LIMIT ' + limit + ' OFFSET ' + offset;

    const data = {...req.body };
    const countAll = 'SELECT COUNT(id) as total_data FROM tb_checklists';
    getChecklists(req, res, query, countAll, data);
};
exports.getDetail = (req, res) => {
    const data = {...req.body };
    const query = 'SELECT * FROM tb_checklists WHERE id = ?';
    getChecklistDetail(req, res, query, req.params.id, data);
};
exports.createData = (req, res) => {
    const data = {...req.body };
    const query = 'INSERT INTO tb_checklists SET ?';
    insertChecklists(req, res, query, data);
};
exports.updateData = (req, res) => {
    const data = {...req.body };
    const findIdQuery = 'SELECT * FROM tb_checklists WHERE id = ?';
    const updateQuery = 'UPDATE tb_checklists SET ? WHERE id = ?';
    updateChecklists(req, res, findIdQuery, updateQuery, req.params.id, data);
};
exports.deleteData = (req, res) => {

    const findIdQuery = 'SELECT * FROM tb_checklists WHERE id = ?';
    const deleteQuery = 'DELETE FROM tb_checklists WHERE id = ?';
    deleteChecklists(req, res, findIdQuery, deleteQuery, req.params.id);
};