const doc = group => {
	return { content: page.form.entity +" : " +group.name};
};

module.init("group",group => group.name);