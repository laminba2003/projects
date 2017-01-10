page.form.edit = () => {
	$('#create').magnificPopup('open');
	page.form.reset();
};

page.form.reset = () => {
	const wizard = $('#wizard').smartWizard('goToStep',1);
	const length = $("> div",wizard).length;
	for(var i=2;i<=length;i++) wizard.smartWizard('disableStep',i);
};

const onFinish = (obj,context) => {
	page.form.submit();
	$('#create').magnificPopup('close');
	return true;
};


page.form.init = function() {
	$('#form').css("display","block").addClass("mfp-hide");
	head.load("templates/nova/js/jquery.smartWizard.js","templates/nova/js/jquery.magnific-popup.min.js", function() {
		var wizard = $('#wizard').addClass("swMain").smartWizard({noForwardJumping:true,onLeaveStep:()=>true,onFinish:onFinish});
		$('#create').magnificPopup({type:'inline'}).click(function(){
			page.form.reset();
		});
	});
};