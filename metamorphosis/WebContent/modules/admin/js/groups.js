const doc = group => {
	return {content : group.name};
};

module.init("group", group => group.name);