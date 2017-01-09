page.form.edit = () => {
	$('#create').magnificPopup('open');
	$('#wizard').smartWizard('goToStep',1);
	$('#wizard').smartWizard('disableStep',2);
};

var onFinish = (obj,context) => {
	page.form.submit();
	$('#create').magnificPopup('close');
	return true;
};


page.form.init = function() {
	$('#form').addClass("hide form mfp-hide");
	head.load("templates/nova/js/jquery.smartWizard.js","templates/nova/js/jquery.magnific-popup.min.js", function() {
		var wizard = $('#wizard').addClass("swMain").smartWizard({noForwardJumping:true,onLeaveStep:()=>true,
	       onFinish:onFinish});
		$('#create').magnificPopup({
			  type:'inline'
		}).click(function(){
			$('#wizard').smartWizard('goToStep',1);
			$('#wizard').smartWizard('disableStep',2);
		});
		$('#form').removeClass("hide");
	});
};