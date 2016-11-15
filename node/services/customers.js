function CustomerService() {
	
	this.register = function(router) {
		router.get('/customers/', function(req, res) {
			var customers = [
                  {"id":"123456545644",
                	  "firstName":"John",
                      "lastName":"Doe",
                      "profession":"Teacher",
                      "dateOfBirth":"04/10/1960",
                      "country":"USA",
	                   "createdBy":"tetiana"}
                ];
			res.send(customers);
		});
		  
		router.get('/customers/:id/', function(req, res) {
		    // get customers req.params.id, res
			res.send( {"id":"123456545644",
          	  "firstName":"John",
              "lastName":"Doe",
              "profession":"Teacher",
              "dateOfBirth":"04/10/1960",
              "country":"USA",
                "sex":"Male",
                "telephone":"338551092",
                "mobile":"775593264",
                "email":"john.doe@yahoo.com",
                "contact" : {
                	"id":"1234566545644",
                	  "firstName":"Eliza",
                    "lastName":"Doe",
                    "profession":"Teacher",
                    "dateOfBirth":"04/10/1965",
                    "country":"USA",
                    "sex":"Female",
	                   "relation":"Wife",
	                   "telephone":"338551092",
	                   "mobile":"776095174",
	                   "email":"eliza.doe@yahoo.com"
                },
                "createdBy":"tetiana"
               });
		});

		router.post('/customers/', function(req, res) {
		    // create req.body, res
			res.send(req.body);
		});

		router.put('/customers/', function(req, res) {
			res.send(req.body);
		});

		router.delete('/customers/:id/', function(req, res) {
			res.send({status : 1, message : "item deleted"});
		});
		
		router.post('/customers/search/', function(req, res) {
			var customers = [
			                  {"id":"123456545644",
			                	  "firstName":"John",
			                      "lastName":"Doe",
			                      "profession":"Teacher",
			                      "dateOfBirth":"04/10/1960",
			                      "country":"USA",
				                   "createdBy":"tetiana"},
				                   {"id":"123456466644",
				                	  "firstName":"Nick",
				                      "lastName":"Jonas",
				                      "profession":"Teacher",
				                      "dateOfBirth":"06/12/1970",
				                      "country":"USA",
					                   "createdBy":"tetiana"}
			                ];
						res.send(customers);
		});
	};
};
module.exports = new CustomerService();