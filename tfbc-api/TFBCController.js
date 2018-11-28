var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

var TFBC = require("./FabricHelper")


// Request LC
router.post('/requestLC', function (req, res) {

TFBC.requestLC(req, res);

});

// Issue LC
router.post('/issueLC', function (req, res) {

    TFBC.issueLC(req, res);
    
});

// Accept LC
router.post('/acceptLC', function (req, res) {

    TFBC.acceptLC(req, res);
    
});

// Get LC
router.post('/getLC', function (req, res) {

    TFBC.getLC(req, res);
    
});

// Get LC history
router.post('/getLCHistory', function (req, res) {

    TFBC.getLCHistory(req, res);
    
});


module.exports = router;
