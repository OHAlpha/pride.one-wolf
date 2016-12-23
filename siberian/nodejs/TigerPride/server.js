// BASE SETUP
// =============================================================================

// call the packages we need
var express    = require('express');        // call express
var app        = express();                 // define our app using express
var bodyParser = require('body-parser');

// configure app to use bodyParser()
// this will let us get the data from a POST
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

var port = process.env.PORT || 80;        // set our port

var Sequelize = require('sequelize');
var sequelize = new Sequelize('database', {
    dialect: 'sqlite3',
    storage: process.env.PORT || '../../rails-5.0/TigerPride/db/development.sqlite3'
});
//var sqlite3 = require('sqlite3').verbose();
//var db = new sqlite3.Database('database.sqlite3');

var Article = sequelize.define('article', {
    name: {
        type: Sequelize.STRING
    },
    text: {
        type: Sequelize.TEXT
    }
});

var Section = sequelize.define('section', {
    name: {
        type: Sequelize.STRING
    },
    text: {
        type: Sequelize.TEXT
    },
    index: {
        type: Sequelize.INTEGER
    }
});

Article.belongsTo(Section);
Section.belongsTo(Article);
Section.hasMany(Section, {as: 'children'});
Section.belongsTo(Section, {as: 'parent'});

// ROUTES FOR OUR API
// =============================================================================
var router = express.Router();              // get an instance of the express Router

// middleware to use for all requests
router.use(function(req, res, next) {
    // do logging
    console.log('Something is happening.');
    next(); // make sure we go to the next routes and don't stop here
});

// test route to make sure everything is working (accessed at GET http://localhost:8080/api)
router.get('/', function(req, res) {
    res.json({ message: 'hooray! welcome to our api!' });   
});

// more routes for our API will happen here

/*
// on routes that end in /bears
// ----------------------------------------------------
router.route('/bears')

    // create a bear (accessed at POST http://localhost:8080/api/bears)
    .post(function(req, res) {
        
        var article_name = req.body.name;  // set the bears name (comes from the request)

        // save the bear and check for errors
        bear.save(function(err) {
            if (err)
                res.send(err);

            res.json({ message: 'Bear created!' });
        });
        
    });
*/

// REGISTER OUR ROUTES -------------------------------
// all of our routes will be prefixed with /api
app.use('/api', router);

// START THE SERVER
// =============================================================================
app.listen(port);
console.log('Magic happens on port ' + port);