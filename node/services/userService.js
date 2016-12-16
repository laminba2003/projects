function UserService() {
	
	this.register = function(router) {
		router.get('/users/', function(req, res) {
			var users = [
                  {"id":"123456545644",
                	  "firstName":"Tetiana",
                      "lastName":"Fydorenchyk",
                      "login":"tetiana",
                      "email":"tf@jelastic.com",
                      "group":"marketing",
                      "role":"director of marketing",
	                   "createdBy":"admin"}
                ];
			res.send(users);
		});
		  
		router.get('/users/:id/', function(req, res) {
		    // get users req.params.id, res
			res.send( {"id":"123456545644",
          	  "firstName":"Tetiana",
              "lastName":"Fydorenchyk",
              "login":"tetiana",
              "email":"tf@jelastic.com",
              "group":"marketing",
              "role":"director of marketing",
              "country":"USA",
                "sex":"Female",
                "telephone":"338551092",
                "mobile":"775593264",
                "email":"tf@jelastic.com",
                "contact" : {
                	"id":"1234566545644",
                	  "firstName":"Marta",
                    "lastName":"Fydorenchyk",
                    "country":"USA",
                    "sex":"Female",
	                   "relation":"Parent",
	                   "email":"marta.fydorenchyk@yahoo.com"
                },
                "createdBy":"admin"
               });
		});

		router.post('/users/', function(req, res) {
		    // create req.body, res
			res.send(req.body);
		});

		router.put('/users/', function(req, res) {
			res.send(req.body);
		});

		router.delete('/users/:id/', function(req, res) {
			res.send({status : 1, message : "item deleted"});
		});
		
		router.post('/users/search/', function(req, res) {
			var users = [
			                  {"id":"123456545644",
			                	  "firstName":"Tetiana",
			                      "lastName":"Fydorenchyk",
			                      "login":"tetiana",
			                      "email":"tf@jelastic.com",
			                      "group":"marketing",
			                      "role":"director of marketing",
				                   "createdBy":"admin"},
				                   {"id":"123456545644",
				                 	  "firstName":"Vadim",
				                      "lastName":"Mikhalets",
				                      "login":"vadim",
				                      "email":"vm@jelastic.com",
				                      "group":"support",
				                      "role":"support manager",
					                   "createdBy":"admin"}
			                ];
						res.send(users);
		});
	};
};
module.exports = new UserService();