const doc = product => {
	return { content: page.form.entity +" : " +product.name};
};

const title = product => product.name;

const nextStep = () => true;

module.init("product");