const doc = user => {
	return { content: page.form.entity +" : " +user.firstName+" "+user.lastName};
};

module.init("user",user => user.firstName+" "+user.lastName);