var print = function(user) {
	var docDefinition = { content: page.form.entity +" : " +user.firstName+" "+user.lastName};
	pdfMake.createPdf(docDefinition).print();
};

var pdf = function(user) {
	var docDefinition = { content: page.form.entity +" : " +user.firstName+" "+user.lastName};
	pdfMake.createPdf(docDefinition).open();
};

page.list.details.show = function(user) {
	page.list.details.setTitle("Details "+page.form.entity + " : " +user.firstName+" "+user.lastName);
	page.list.details.render(["informations","contact","permissions"],user);
};

var leaveAStepCallback = function() {
	return true;
};

module.init("user");