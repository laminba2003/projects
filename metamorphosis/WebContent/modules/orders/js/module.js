const doc = order => {
	return { content: page.form.entity +" : " +order.product};
};

const title = order => order.product;

const nextStep = () => true;

module.init("order");