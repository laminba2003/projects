var express = require("express");
var http = require('http');
var bodyparser = require("body-parser");
var cors = require('cors');
var fs = require('fs');

var app = express();
app.use(bodyparser.urlencoded({extended : true}));
app.use(bodyparser.json());
app.use(cors());

var router =  express.Router();
var dir = './services';
fs.readdir(dir, function(err, files) {
	files.forEach(function(file,index) {
		var service = require(dir+'/'+file);
		service.mount(router);
	});
});

app.use("/",router);

var server = http.createServer(app);

server.listen(9090,function(){
	console.log('Server listening on port ' + server.address().address + ' '+server.address().port);
});