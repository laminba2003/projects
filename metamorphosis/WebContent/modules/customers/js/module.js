var doc = function(customer) {
	return {content: page.form.entity +" : " +customer.firstName+" "+customer.lastName};
};

page.list.details.show = function(customer) {
	page.list.details.setTitle("Details "+page.form.entity + " : " +customer.firstName+" "+customer.lastName);
	page.list.details.render(["informations","contact"],customer);
};

var leaveAStepCallback = function() {
	return true;
};

module.init("customer");