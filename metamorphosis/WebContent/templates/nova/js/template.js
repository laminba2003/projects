page.form.edit = function() {
	$('#new').magnificPopup('open');
	$('#wizard').smartWizard('goToStep',1);
	$('#wizard').smartWizard('disableStep',2);
	$('.form h1').html("Edit "+page.form.entity+": Informations");
};

var onFinishCallback = function(obj,context) {
	page.form.submit();
	$('#new').magnificPopup('close');
	return true;
};


page.form.init = function() {
	$('#form').addClass("hide form mfp-hide");
	head.load("templates/nova/js/jquery.smartWizard.js","templates/nova/js/jquery.magnific-popup.min.js", function() {
		var wizard = $('#wizard').addClass("swMain").smartWizard({noForwardJumping:true,onLeaveStep:leaveAStepCallback,
	       onFinish:onFinishCallback});
		$('#new').magnificPopup({
			  type:'inline'
		});
		$('#form').removeClass("hide");
	});
};