const doc = order => {
	return { content: page.form.entity +" : " +order.product};
};

module.init("order",order => order.product);