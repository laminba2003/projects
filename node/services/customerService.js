function CustomerService() {
	
	this.register = function(router) {
		router.get('/customers/', function(request, response) {
			var customers = [
                  {"id":"123456545644",
                	  "firstName":"John",
                      "lastName":"Doe",
                      "profession":"Teacher",
                      "dateOfBirth":"04/10/1960",
                      "country":"USA",
	                   "createdBy":"tetiana"}
                ];
			response.send(customers);
		});
		  
		router.get('/customers/:id/', function(request, response) {
			response.send( {"id":"123456545644",
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

		router.post('/customers/', function(request, response) {
			response.send(request.body);
		});

		router.put('/customers/', function(request, response) {
			response.send(request.body);
		});

		router.delete('/customers/:id/', function(request, response) {
			response.send({status : 1, message : "item deleted"});
		});
		
		router.post('/customers/search/', function(request, response) {
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
			response.send(customers);
		});
	};
};
module.exports = new CustomerService();