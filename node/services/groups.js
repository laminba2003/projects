function GroupService() {
	
	this.register = function(router) {
		router.get('/groups/', function(req, res) {
			var groups = [
                  {"id":"123456545644",
                	  "name":"marketing",
	                   "createdBy":"admin"}
                ];
			res.send(groups);
		});
		  
		router.get('/groups/:id/', function(req, res) {
		    // get groups req.params.id, res
			res.send({"id":"123456545644",
          	  "name":"marketing",
              "createdBy":"admin"});
		});

		router.post('/groups/', function(req, res) {
		    // create req.body, res
			res.send(req.body);
		});

		router.put('/groups/', function(req, res) {
			res.send(req.body);
		});

		router.delete('/groups/:id/', function(req, res) {
			res.send({status : 1, message : "item deleted"});
		});
		
		router.post('/groups/search/', function(req, res) {
			var groups = [
			                  {"id":"123456545644",
			                	  "name":"marketing",
			                	  "createdBy":"admin"},
			                	  {"id":"1234565875644",
			                    	  "name":"support",
			    	                   "createdBy":"admin"}
			                ];
						res.send(groups);
		});
	};
};
module.exports = new GroupService();