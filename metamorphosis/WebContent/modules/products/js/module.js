var doc = function(product) {
	return { content: page.form.entity +" : " +product.name};
};

page.list.details.show = function(product) {
	page.list.details.setTitle("Details "+page.form.entity + " : "+product.name);
	page.list.details.render(["informations-1","informations-2"],product);
};

var nextStep = function() {
	return true;
};

module.init("product");