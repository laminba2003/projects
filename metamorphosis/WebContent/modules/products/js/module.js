var print = function(product) {
	var docDefinition = { content: page.form.entity +" : " +product.name};
	pdfMake.createPdf(docDefinition).print();
};

var pdf = function(product) {
	var docDefinition = { content: page.form.entity +" : " +product.name};
	pdfMake.createPdf(docDefinition).open();
};

page.list.details.show = function(product) {
	page.list.details.setTitle("Details "+page.form.entity + " : "+product.name);
	page.list.details.render(["informations-1","informations-2"],product);
};

var leaveAStepCallback = function() {
	return true;
};

module.init("product");