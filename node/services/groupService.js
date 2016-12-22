function GroupService() {
	
	this.mount = function(router) {
		
		router.get('/groups/', function(request, response) {
			var groups = [
                  {"id":"123456545644",
                	  "name":"marketing",
	                   "createdBy":"admin"}
                ];
			response.send(groups);
		});
		  
		router.get('/groups/:id/', function(request, response) {
			response.send({"id":"123456545644",
          	  "name":"marketing",
              "createdBy":"admin"});
		});

		router.post('/groups/', function(request, response) {
			response.send(request.body);
		});

		router.put('/groups/', function(request, response) {
			response.send(request.body);
		});

		router.delete('/groups/:id/', function(request, response) {
			response.send({status : 1, message : "entity deleted"});
		});
		
		router.post('/groups/search/', function(request, response) {
			var groups = [
			                  {"id":"123456545644",
			                	  "name":"marketing",
			                	  "createdBy":"admin"},
			                	  {"id":"1234565875644",
			                    	  "name":"support",
			    	                   "createdBy":"admin"}
			              ];
		   response.send(groups);
		});
	};
};
module.exports = new GroupService();