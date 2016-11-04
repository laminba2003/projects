var doc = function(order) {
	return { content: page.form.entity +" : " +order.product};
};

page.list.details.show = function(order) {
	page.list.details.setTitle("Details "+ page.form.entity +" : " +order.product);
	page.list.details.render(["informations-1","informations-2"],order);
};

var nextStep = function() {
	return true;
};

module.init("order");