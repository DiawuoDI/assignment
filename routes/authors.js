const express = require('express');
const router = express.Router();
const authors = require('../controllers/authors');

router.post('/author',authors.create);

router.get('/author',authors.getall);

router.get('/author',authors.getSingle);

router.patch('/author',authors.patch);

module.exports = router