const doc = user => {
	return {content : user.firstName+" "+user.lastName};
};

module.init("user", user => user.firstName+" "+user.lastName);