const doc = group => {
	return { content: page.form.entity +" : " +group.name};
};

const title = group => group.name;

const nextStep = () => true;

module.init("group");