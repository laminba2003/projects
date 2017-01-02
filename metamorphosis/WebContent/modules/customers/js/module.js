const doc = customer => {
	return {content: page.form.entity +" : " +customer.firstName+" "+customer.lastName};
};

const title = customer => customer.firstName+" "+customer.lastName;

const nextStep = () => true;

module.init("customer");