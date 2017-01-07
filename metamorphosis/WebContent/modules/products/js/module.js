const doc = product => {
	return { content: page.form.entity +" : " +product.name};
};

module.init("product",product => product.name);