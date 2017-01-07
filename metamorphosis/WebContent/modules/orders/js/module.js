const doc = order => {
	return { content: page.form.entity +" : " +order.product};
};

const title = order => order.product;

module.init("order");