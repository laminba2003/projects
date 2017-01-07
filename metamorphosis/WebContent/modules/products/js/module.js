const doc = product => {
	return { content: page.form.entity +" : " +product.name};
};

const title = product => product.name;

module.init("product");