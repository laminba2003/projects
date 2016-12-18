function ProductService() {
	
	this.register = function(router) {
		router.get('/products/', function(response, response) {
			var products = [
                  {"id":"123456545644",
                	  "name":"Computer",
                      "price":"2000.0",
	                   "createdBy":"tetiana"}
                ];
			response.send(products);
		});
		  
		router.get('/products/:id/', function(response, response) {
			response.send( {"id":"123456545644",
          	  "name":"Computer",
              "price":"2000.0",
               "createdBy":"tetiana"});
		});

		router.post('/products/', function(response, response) {
			response.send(response.body);
		});

		router.put('/products/', function(response, response) {
			response.send(response.body);
		});

		router.delete('/products/:id/', function(response, response) {
			response.send({status : 1, message : "entity deleted"});
		});
		router.post('/products/search', function(response, response) {
			var products = [
			                  {"id":"123456545644",
			                	  "name":"Computer",
			                      "price":"2000.0",
				                   "createdBy":"tetiana"},
				                   {"id":"12345122244",
					                	  "name":"KeyBoard",
					                      "price":"500.0",
						                   "createdBy":"tetiana"}
			                ];
			response.send(products);
		});
	};
};
module.exports = new ProductService();