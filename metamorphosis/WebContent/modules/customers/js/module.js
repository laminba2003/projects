var print = function(customer) {
	var docDefinition = {content: page.form.entity +" : " +customer.firstName+" "+customer.lastName};
	pdfMake.createPdf(docDefinition).print();
};

var pdf = function(customer) {
	var docDefinition = {content: page.form.entity +" : " +customer.firstName+" "+customer.lastName};
	pdfMake.createPdf(docDefinition).open();
};

page.list.details.show = function(customer) {
	page.list.details.setTitle("Details "+page.form.entity + " : " +customer.firstName+" "+customer.lastName);
	page.list.details.render(["informations","contact"],customer);
};

var leaveAStepCallback = function() {
	return true;
};

module.init("customer");