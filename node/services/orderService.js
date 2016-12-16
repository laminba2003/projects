function OrderService() {
	
	this.register = function(router) {
		router.get('/orders/', function(req, res) {
			var orders = [
                  {"id":"123456545644",
                	  "product":"Computer",
                      "price":"2000.0",
                      "quantity":"10",
                      "amount":"20000.0",
                      "customer":"John Doe",
	                   "createdBy":"tetiana"}
                ];
			res.send(orders);
		});
		  
		router.get('/orders/:id/', function(req, res) {
		    // get orders req.params.id, res
			res.send( {"id":"123456545644",
          	  "product":"Computer",
          	"quantity":"10",
              "price":"2000.0",
              "amount":"20000.0",
              "customer":"John Doe",
               "createdBy":"tetiana"});
		});

		router.post('/orders/', function(req, res) {
		    // create req.body, res
			res.send(req.body);
		});

		router.put('/orders/', function(req, res) {
			res.send(req.body);
		});

		router.delete('/orders/:id/', function(req, res) {
			res.send({status : 1, message : "item deleted"});
		});
		router.post('/orders/search', function(req, res) {
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
			res.send(orders);
		});
	};
};
module.exports = new OrderService();