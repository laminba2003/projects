const doc = user => {
	return { content: page.form.entity +" : " +user.firstName+" "+user.lastName};
};

const title = user => user.firstName+" "+user.lastName;

const nextStep = () => true;

module.init("user");