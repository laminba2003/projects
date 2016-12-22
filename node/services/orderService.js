function OrderService() {
	
	this.mount = function(router) {
		
		router.get('/orders/', function(request, response) {
			var orders = [
                  {"id":"123456545644",
                	  "product":"Computer",
                      "price":"2000.0",
                      "quantity":"10",
                      "amount":"20000.0",
                      "customer":"John Doe",
	                   "createdBy":"tetiana"}
                ];
			response.send(orders);
		});
		  
		router.get('/orders/:id/', function(request, response) {
			response.send( {"id":"123456545644",
          	  "product":"Computer",
          	"quantity":"10",
              "price":"2000.0",
              "amount":"20000.0",
              "customer":"John Doe",
               "createdBy":"tetiana"});
		});

		router.post('/orders/', function(request, response) {
			response.send(request.body);
		});

		router.put('/orders/', function(request, response) {
			response.send(request.body);
		});

		router.delete('/orders/:id/', function(request, response) {
			response.send({status : 1, message : "entity deleted"});
		});
		router.post('/orders/search', function(request, response) {
			var orders = [
			                  {"id":"123456545644",
			                	  "product":"Computer",
			                      "price":"2000.0",
			                      "quantity":"10",
			                      "amount":"20000.0",
			                      "customer":"John Doe",
				                   "createdBy":"tetiana"},
				                   {"id":"12345122244",
					                	  "product":"KeyBoard",
					                      "price":"500.0",
					                      "quantity":"5",
					                      "amount":"2500.0",
					                      "customer":"John Doe",
						                   "createdBy":"tetiana"}
			                ];
			response.send(orders);
		});
	};
};
module.exports = new OrderService();