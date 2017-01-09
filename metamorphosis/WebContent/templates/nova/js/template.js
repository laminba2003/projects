page.form.edit = () => {
	$('#create').magnificPopup('open');
	$('#wizard').smartWizard('goToStep',1);
	$('#wizard').smartWizard('disableStep',2);
};

const onFinish = (obj,context) => {
	page.form.submit();
	$('#create').magnificPopup('close');
	return true;
};


page.form.init = function() {
	$('#form').addClass("mfp-hide");
	$("section > h1").addClass("icon-32").addClass(page.form.entity.toLowerCase()+"-32");
	$('<h1 class="icon-32"></h1>').addClass(page.form.entity.toLowerCase()+"-32").insertBefore("#wizard");
	$("#selection span").addClass("icon-16").addClass(page.form.entity.toLowerCase()+"-16");
	$('<h2 class="icon-16"></h2>').addClass(page.form.entity.toLowerCase()+"-16").insertBefore("ul.tabs");
	head.load("templates/nova/js/jquery.smartWizard.js","templates/nova/js/jquery.magnific-popup.min.js", function() {
		var wizard = $('#wizard').addClass("swMain").smartWizard({noForwardJumping:true,onLeaveStep:()=>true,onFinish:onFinish});
		$('#create').magnificPopup({type:'inline'}).click(function(){
			$('#wizard').smartWizard('goToStep',1);
			$('#wizard').smartWizard('disableStep',2);
		});
	});
};