const doc = customer => {
	return {content: page.form.entity +" : " +customer.firstName+" "+customer.lastName};
};

module.init("customer",customer => customer.firstName+" "+customer.lastName);