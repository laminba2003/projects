page.list = {};

page.list.render = (url,message) => {
	page.list.init(url,message);
	app.get(page.list.url, entities => {
		page.render($("#list tbody"), entities, rows => {
			page.list.display(rows);
		});
	});
};

page.list.init = (url,message) => {
	page.list.url = app.apiURL+url;
	page.list.message = message;
	$("#list").attr("tabindex","1").click(() => {
		$("#contextmenu").hide();
		return false;
	});
};

page.list.display = rows => {
	if(!rows.length) {
		var size = $("#list th").length;
		$('#list tbody').append("<tr class='empty'><td valign='top' colspan='"+size+"'>"+page.list.message+"</td></tr>");
	} else {
		page.list.bindRow(rows);
		page.list.bindContextmenu(rows);
		page.list.paginate();
		$("#details").hide();
		$("#selection").slideDown(500);
	}
};

page.list.bindRow = element => {
	element.click(function(event){
		$("#list tr.active").removeClass("active");
		$("#list tr.focus").removeClass("focus");
		$("#list").focus();
		var row = $(this);
		row.addClass("active").addClass("focus");
		$("#selection").hide();
		var details = $("#details").show();
		var id = row.attr("id");
		app.get(page.list.url+"/"+id, data => {
			page.list.selectedRow = {id:id,data:data,element:row};
			page.list.details.show(data);
			var activeTab = $("ul.tabs li.active").attr("rel");
		});
		return false;
	}).contextmenu(function(event){
		$("#list tr.focus").removeClass("focus");
		var row = $(this);
		row.addClass("focus");
		var id = row.attr("id");
		var top = row.position().top;
		var left = event.pageX;
		if(left>window.innerWidth-100) {
			left = window.innerWidth -200;
		}
		$("#contextmenu").show().css({top : top+10, left:left});
	    return false;
	});
	
};

page.list.removeRow = row => {
	app.delete(page.list.url+"/"+row.id, data => {
		var next = row.element.next();
		if(next.length) {
			next.click();
		} else {
			 row.element.prev().click();
		}
		row.element.remove();
		if(!$("#list tbody tr").length) {
			var size = $("#list th").length;
			$('#list tbody').append("<tr class='empty'><td  valign='top' colspan='"+size+"'>"+page.list.message+"</td></tr>");
			$("#details").hide();
			$("#selection").hide();
		}else {
			var number = $(".page-number.active").text();
			page.list.paginate();
			if(number <= $(".page-number").length) {
			  $(".page-number").eq(number-1).click();
			} else if(number > $(".page-number").length) {
				$(".page-number").eq(number-2).click();
			}
		}
	});
	
};

page.list.bindContextmenu = element => {
	$(element).contextmenu(function(event){
		var row = $(this);
		var id = row.attr("id");
		$("a",contextmenu).unbind("click");
		$(".new-16",contextmenu).click(function(event){
		   page.form.create();
		});
		$(".row-select",contextmenu).click(function(event){
			row.click();
		});
		$(".edit-16",contextmenu).click(function(event){
		    page.list.selectedRow = {id:id,element:row};
			app.get(page.list.url+"/"+id,function(data){
				populate($(".form"),data);
  				page.form.edit(data);
  				page.edit = true;
  			});
		});
		$(".delete-16",contextmenu).click(function(event){
			page.confirmDialog.confirm(function(){
				page.list.removeRow({id:id,element:row});
			});
		});
		$(".print-16",contextmenu).click(function(event){
			page.print(page.list.url+"/"+id);
		});
		$(".pdf-16",contextmenu).click(function(event){
			page.pdf(page.list.url+"/"+id);
		});
	    return false;
	});
};

function populate(form, data) {
	  $.each(data, function(key, value){
	    $('[name='+key+']', form).val(value);
	    if(value === Object(value)) {
	    	$.each(value, function(k, val){
	    	    $('[name='+key+"\\["+k+'\\]]', form).val(val);
	    	 });
	    }
	  });
};

page.list.addRow = data => {
	$('#list tbody tr.empty').remove();
	page.render($("#list tbody"),data,true,row => {
		page.list.paginate();
		page.list.bindRow(row);
		page.list.bindContextmenu(row,page.list.callback);
		$("span.page-number:last").click();
		$(row).attr("id","1455555").click();
	});
	
};

page.list.updateRow = data => {
	var container = $("<div/>");
	page.render($("#list tbody"),data,false,container,row => {
		page.list.selectedRow.element.html($("tr",container).html());
		page.list.selectedRow.element.click();
	});
};

page.list.paginate = () => {
	$('#list table').unbind("repaginate");
	$('#list table').each(function() {
		 $(".pager").remove();
	    var currentPage = 0;
	    var $table = $(this);
	    var numPerPage = $table.attr("data-rows")?$table.attr("data-rows") :7;
	    $table.bind('repaginate', function() {
	        $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	    });
	    $table.trigger('repaginate');
	    var numRows = $table.find('tbody tr').length;
	    if(numRows > numPerPage) {
		    var numPages = Math.ceil(numRows / numPerPage);
		    var $pager = $('<div class="pager"></div>').attr("id","pager"+$table.parent().attr("id"));
		    for (var page = 0; page < numPages; page++) {
		        $('<span class="page-number"></span>').text(page + 1).bind('click', {
		            newPage: page
		        }, function(event) {
		            currentPage = event.data['newPage'];
		            $table.trigger('repaginate');
		            $(this).addClass('active').siblings().removeClass('active');
		            $table.parent().focus();
		            return false;
		        }).appendTo($pager);
		    }
		    $pager.insertAfter($table.parent()).find('span.page-number:first').addClass('active');
		 }
	});
};

page.list.details = {};

page.list.details.setTitle = title => {
	$("#details > h2").html(title);
	$("#details > h2").append("<a title='Edit' class='edit-16'></a>");
	 $("#details > h2 a.edit-16").click(function(event){
		 app.get(page.list.url+"/"+page.list.selectedRow.id,data => {
				populate($(".form"),data);
				page.form.edit(data);
				page.edit = true;
				var number = Math.floor(page.list.selectedRow.element.index() / 7);
				$(".page-number").eq(number).click();
			});
	      return false;
	});
	 $("#details > h2").append("<a title='Delete' class='delete-16'></a>");
	 $("#details > h2 a.delete-16").click(function(event){
		page.confirmDialog.confirm(function(){
			 page.list.removeRow(page.list.selectedRow);
				var number = Math.floor(page.list.selectedRow.element.index() / 7);
				$(".page-number").eq(number).click();
		});
		return false;
	});
	if(isChrome) {
  		$("#details > h2").append("<a title='Imprimer' class='print-16'></a>");
  		$("#details > h2 a.print-16").click(function(event){
  			page.print(page.list.url+"/"+page.list.selectedRow.id);
 			return false;
 	    });
  	 }
  	 $("#details > h2").append("<a title='PDF' class='pdf-16'></a>");
	 $("#details > h2 a.pdf-16").click(function(event){
		 page.pdf(page.list.url+"/"+page.list.selectedRow.id);
		 return false;
	});
};

page.list.details.addButton = function(title,icon){
	return $("#details > h2").append("<a title='"+title+"' class='"+icon+"'></a>");
};

page.list.details.render = (list,data) => {
	for(var i=0;i<list.length;i++) {
		page.render($("#"+list[i]),data);
	}
};

page.search = {};

page.search.init = () => {
	$('#search input').val("").focus();
	$('#search').submit(function(){
	     var value =  $('input',this).val();
	     if(!value.trim()) {
	   	   alert("enter your search");
	   	   return false;
	     } 
	     var formData = $(this).serialize();
		 app.post(page.list.url+"/search",formData, data => {
			page.render($("#list tbody"), data, rows => {
				page.list.display(rows);
			});
		 });
		return false;
	});
};

page.form = {};

page.form.submit = () => {
	if(!page.edit) {
		 app.post(page.list.url, $("#form").serialize(), data => {
			 page.list.addRow([data]);
			 return false;
		 });
	}else {
		 app.put(page.list.url, $("#form").serialize(), data => {
			 page.list.updateRow([data]);
		 });
	}
	page.edit = false;
};

page.form.create = () => {
	page.edit = false;
	$('#new').click();
};

const module = {};

module.init = entity => {
	app.ready(() => {
		page.form.entity = entity[0].toUpperCase() + entity.slice(1);
		page.form.init();
		$('#new').click(() => {
			$('.form h1').html("Create "+page.form.entity +" : Informations");
			$('.form input:not([type=hidden]').val("");
			$('#form').removeClass("hide");
			page.edit = false;
			return false;
		});
		page.list.render(entity+"s","no "+entity);
		page.search.init();
	});
};

page.confirmDialog = {};

page.confirmDialog.confirm = callback => {
	$("#contextmenu").hide();
	$(".confirm-dialog-container").show();
	$("#confirm-dialog-ok").unbind("click").click(() => {
		$(".confirm-dialog-container").hide();
		callback();
	}).focus();
	
};

app.ready(() => {
	
	var array = window.location.pathname.split( '/' );
	var path = "";
	for( var i = 2;i<array.length;i++) {
		path += array[i];
		$('a[href$='+array[i]+"]").addClass('active');
	}
	if(path=="") {
		$('a[href$='+array[1]+"]").addClass('active');
	}
	if($("aside a.active").length>1) {
		$("aside a.active:first").removeClass("active");
	}
	
	$(".tab_content").hide();
	$(".tab_container .tab_content:first-child").show(); 

	$("ul.tabs li").click(function() {
		var parent = $(this).parent();
		$("li",parent).removeClass("active");
		$(this).addClass("active");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab).parent().find(".tab_content").hide();
		$("#"+activeTab).fadeIn(); 
	});
	
	if(!isChrome) {
		$(".print-16").hide();
		
	}
	
	$("body").append('<div class="confirm-dialog-container">'+
			'<div class="confirm-dialog">'+
			'<span class="confirm-dialog-title">Confirmation</span>'+
			'<span class="confirm-dialog-message">Are you sure you want to delete this item?</span>'+
			'<a id="confirm-dialog-cancel" tabindex="2" class="confirm-dialog-button">Cancel</a>'+
			'<a id="confirm-dialog-ok" tabindex="1" class="confirm-dialog-button">OK</a></div></div>');
	
	$("body").append('<div class="alert-dialog-container">'+
			'<div class="alert-dialog">'+
			'<span class="alert-dialog-title">Alert</span>'+
			'<span class="alert-dialog-message"></span>'+
			'<a id="alert-dialog-ok" tabindex="1" class="alert-dialog-button">OK</a></div></div>');

	
	$("#confirm-dialog-cancel").click(function(event){
		$(".confirm-dialog-container").hide();
	});
	
	$("#alert-dialog-ok").click(function(event){
		$(".alert-dialog-container").hide();
	});
	
	 $(".confirm-dialog-container").on('keydown', function (e) {     
	        switch (e.keyCode) {
	            case 27: // esc
	            	$(this).hide();
	                break;
	            case 9: // esc
	            	var element = document.activeElement == $("#confirm-dialog-ok")[0] ? $("#confirm-dialog-cancel") : $("#confirm-dialog-ok"); 
	            	element.focus();
	                break;
	            case 13: // enter
	            	$(document.activeElement).click();
	                break;
	        }
	       return false;
	 }).attr("tabindex","1"); 
	
	$("body").click(function(event){
		$("#contextmenu").hide();
		$("tr.focus").removeClass("focus");
	}).append("<div class='wait'/>");
	
});