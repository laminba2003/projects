var doc = function(group) {
	return { content: page.form.entity +" : " +group.name};
};

page.list.details.show = function(group) {
	page.list.details.setTitle("Details "+page.form.entity + " : " +group.name);
	page.list.details.render(["informations","permissions"],group);
};

var nextStep = function() {
	return true;
};

module.init("group");