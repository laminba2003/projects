var print = function(order) {
	var docDefinition = { content: page.form.entity +" : " +order.product};
	pdfMake.createPdf(docDefinition).print();
};

var pdf = function(order) {
	var docDefinition = { content: page.form.entity +" : " +order.product};
	pdfMake.createPdf(docDefinition).open();
};

page.list.details.show = function(order) {
	page.list.details.setTitle("Details "+ page.form.entity +" : " +order.product);
	page.list.details.render(["informations-1","informations-2"],order);
};

var leaveAStepCallback = function() {
	return true;
};

module.init("order");