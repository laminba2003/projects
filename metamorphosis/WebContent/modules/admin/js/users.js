var doc = function(user) {
	return { content: page.form.entity +" : " +user.firstName+" "+user.lastName};
};

page.list.details.show = function(user) {
	page.list.details.setTitle("Details "+page.form.entity + " : " +user.firstName+" "+user.lastName);
	page.list.details.render(["informations","contact","permissions"],user);
};

var nextStep = function() {
	return true;
};

module.init("user");