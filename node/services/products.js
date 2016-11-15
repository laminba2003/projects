function ProductService() {
	
	this.register = function(router) {
		router.get('/products/', function(req, res) {
			var products = [
                  {"id":"123456545644",
                	  "name":"Computer",
                      "price":"2000.0",
	                   "createdBy":"tetiana"}
                ];
			res.send(products);
		});
		  
		router.get('/products/:id/', function(req, res) {
		    // get products req.params.id, res
			res.send( {"id":"123456545644",
          	  "name":"Computer",
              "price":"2000.0",
               "createdBy":"tetiana"});
		});

		router.post('/products/', function(req, res) {
		    // create req.body, res
			res.send(req.body);
		});

		router.put('/products/', function(req, res) {
			res.send(req.body);
		});

		router.delete('/products/:id/', function(req, res) {
			res.send({status : 1, message : "item deleted"});
		});
		router.post('/products/search', function(req, res) {
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
			res.send(products);
		});
	};
};
module.exports = new ProductService();