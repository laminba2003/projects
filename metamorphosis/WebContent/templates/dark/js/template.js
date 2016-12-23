page.animate = function(element) {
	element.addClass('animated shake');
};

page.form.edit = function() {
	$('.form h1').html("Update "+page.form.entity+" : Informations");
	$('#form').removeClass("hide");
	page.edit = true;
};

page.form.init = function() {
	$('#form').addClass("form");
	head.load("templates/dark/css/jquery-ui.css","templates/dark/js/jquery-ui.min.js","templates/dark/js/jquery.jWizard.js", function() {
		var options = {
				effects: {
					  steps: {
					    hide: {
					      effect:    "explode",
					      direction: "left",
					      duration:  250
					    }
					  }
					}
		};
		var wizard = $('#wizard').jWizard(options);
		wizard.on("click",function(){
			return false;
		});
		wizard.on("wizardcancel",function(){
			$('#form').addClass("hide");
		});
		wizard.on("wizardfinish",function(){
			$('#form').addClass("hide");
			page.form.submit();
		});
	});
};