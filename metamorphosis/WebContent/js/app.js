app.apiURL = "http://env-4347792.mircloud.host/";

window.addEventListener('offline', () => {
	$("<div id='offline'><span>You are currently offline</span></div>").appendTo($("body"));
	app.wait();
});

window.addEventListener('online', () => {
	$("div#offline").remove();
	app.release();
});

const alert = message => {
	$("#alert-dialog-container span:nth-child(2)").html(message);
	$("#alert-dialog-container").show();
	return false;
};

const confirm = callback => {
	$("body").trigger("click");
	const container = $("#confirm-dialog-container").show();
	$("#confirm-dialog-ok").one("click",() => {
		container.hide();
		callback();
	}).focus();
};

page.table = {};

page.table.init = entity => {
	page.table.url = app.apiURL+entity+"s";
	page.table.message = "no "+entity;
	const menu = $("<div id='contextmenu'></div>").insertAfter($("#list"));
	$("<a class='icon-16'>Select</a>").addClass(entity+"-16").appendTo(menu).click(() => page.table.selectedRow.element.click());
	$("<a class='edit-16'>Update</a>").appendTo(menu).click(() => page.table.editRow(page.table.selectedRow));
	$("<a class='delete-16'>Delete</a>").appendTo(menu).click(() => confirm(() => page.table.removeRow(page.table.selectedRow)));
	$("<a class='print-16'>Print</a>").appendTo(menu).click(() => page.print(page.table.url+"/"+page.table.selectedRow.id));
	$("<a class='pdf-16'>PDF</a>").appendTo(menu).click(() => page.pdf(page.table.url+"/"+page.table.selectedRow.id));
};

page.table.render = entity => {
	page.table.init(entity);
	app.get(page.table.url, entities => page.render($("tbody"), entities, page.table.display));
};

page.table.display = rows => {
	if(!rows.length) {
		$("tbody").append("<tr class='empty'><td valign='top' colspan='"+$("th").length+"'>"+page.table.message+"</td></tr>");
		$("#details").hide();
		$("#selection").hide();
	} else {
		$.each(rows,(i,row) => $("td:first-child",row).addClass("icon-16").addClass(page.form.entity.toLowerCase()+"-16"));
		page.table.bind(rows);
		page.table.paginate();
		page.table.details.hide(true);
	}
};

page.table.bind = element => {
	element.click(function(event){
		$("tr.active").removeClass("active");
		$("tr.focus").removeClass("focus");
		const row = $(this).addClass("active").addClass("focus");
		const id = row.attr("id");
		app.get(page.table.url+"/"+id, entity => page.table.details.show(entity,{id:id,element:row}));
		return false;
	}).contextmenu(function(event){
		$("tr.focus").removeClass("focus");
		const row = $(this).addClass("focus");
		page.table.selectedRow = {id:row.attr("id"),element:row};
		const top = row.position().top;
		var left = event.pageX;
		if(left>window.innerWidth-100) left = window.innerWidth -200;
		$("#contextmenu").show().css({top : top+10, left:left});
	    return false;
	});
	
};

page.table.removeRow = row => {
	app.delete(page.table.url+"/"+row.id, () => {
		const next = row.element.next();
		next.length ? next.click() : row.element.prev().click();
		row.element.remove();
		if(!$("tbody tr").length) {
			$("tbody").append("<tr class='empty'><td  valign='top' colspan='"+$("th").length+"'>"+page.table.message+"</td></tr>");
			$("#details").hide();
			$("#selection").hide();
		}else {
			const number = $(".page-number.active").text();
			page.table.paginate();
			if(number <= $(".page-number").length) {
			  $(".page-number").eq(number-1).click();
			} else if(number > $(".page-number").length) {
				$(".page-number").eq(number-2).click();
			}
		}
	});
};

page.table.addRow = entity => {
	$("tr.empty").remove();
	page.render($("tbody"), [entity], true, row => {
		$("td:first-child",row).addClass("icon-16").addClass(page.form.entity.toLowerCase()+"-16");
		page.table.paginate();
		page.table.bind(row);
		$("span.page-number:last").click();
		row.attr("id","1455555").click();
	});
};

page.table.editRow = row => {
	app.get(page.table.url+"/"+row.id,entity => {
		page.deserialize($("#form"),entity);
		page.form.edit(entity);
		$('#form h1').html("Update "+page.form.entity+": Informations");
		page.edit = true;
		page.table.details.show(entity,row);
		$(".page-number").eq(Math.floor(row.element.index() / 7)).click();
	});
};

page.table.updateRow = entity => {
	const container = $("<div/>");
	page.render($("tbody"), [entity] ,false, container, row => {
		page.table.selectedRow.element.html($("tr",container).html());
		$("td:first-child",page.table.selectedRow.element).addClass("icon-16").addClass(page.form.entity.toLowerCase()+"-16");
		page.table.selectedRow.element.click();
	});
};

page.deserialize = (form, entity) => {
    $.each(entity, function(key, value){
      $('[name='+key+']', form).val(value);
      if(value === Object(value)) {
    	 $.each(value, function(k, val){
    	    $('[name='+key+"\\["+k+'\\]]', form).val(val);
    	 });
      }
     });
};

page.table.paginate = () => {
	$("table").unbind("repaginate").each(function() {
		$(".pager").remove();
	    var currentPage = 0;
	    const $table = $(this);
	    const numPerPage = 7;
	    $table.bind('repaginate', function() {
	        $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	    });
	    $table.trigger('repaginate');
	    const numRows = $table.find('tbody tr').length;
	    if(numRows > numPerPage) {
		    const numPages = Math.ceil(numRows / numPerPage);
		    const $pager = $('<div class="pager"></div>').attr("id","pager"+$table.parent().attr("id"));
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

page.table.details = {};

page.table.details.show = (entity,row) => {
	$.each($("#tabs > div"),(i, element) => page.render($(element),entity));
	const h2 = $("#details > h2").html("Details "+page.form.entity + " : " +page.table.details.title(entity));
	$("<a title='Edit' class='edit-16'></a>").appendTo(h2).click(() => page.table.editRow(row));
	$("<a title='Delete' class='delete-16'></a>").appendTo(h2).click(() => confirm(() => page.table.removeRow(row)));
	$("<a title='Imprimer' class='print-16'></a>").appendTo(h2).click(() => page.print(page.table.url+"/"+row.id));
	$("<a title='PDF' class='pdf-16'></a>").appendTo(h2).click(() => page.pdf(page.table.url+"/"+row.id));
	$("#details > h2 a").click(() => false);
	page.table.details.hide(false);
	page.table.selectedRow = row;
};

page.table.details.hide = hide => {
	if(hide) {
		$("#details").hide();
		$("#selection").slideDown(500);
	}else {
		$("#selection").hide();
		$("#details").show();
	}
};

page.search = {};

page.search.init = () => {
	$('#search input').val("").focus();
	$('#search').submit(function(){;
	     if(!$('input',this).val().trim()) return alert("enter your search");
	     const data = $(this).serialize();
		 app.post(page.table.url+"/search",data, entities => page.render($("tbody"), entities, page.table.display));
		 return false;
	});
};

page.form = {};

page.form.submit = () => {
	if(!page.edit) {
		 app.post(page.table.url, $("#form").serialize(), page.table.addRow);
	}else {
		 app.put(page.table.url, $("#form").serialize(), page.table.updateRow);
	}
	page.edit = false;
};

page.form.create = () => {
	page.edit = false;
	$('#form h1').html("Create "+page.form.entity +" : Informations");
	$('#form')[0].reset();
	return false;
};

page.tabs = {};

page.tabs.init = (entity) => {
	var tabs = $("#details #tabs").addClass("tab_container");
	const ul = $('<ul class="tabs"></ul>').insertBefore(tabs);
	$.each($("> div",tabs),(index, element) => {
		  const div= $(element).attr("id","tab"+index).addClass("tab_content").hide();
		  const h2 = $("<h2>"+div.attr("title")+"</h2>").attr("title",div.attr("title"));
		  const li = $("<li/>").attr("rel",div.attr("id")).html(h2);
		  li.click(function() {
				const parent = $(this).parent();
				$("li",parent).removeClass("active");
				$(this).addClass("active");
				const activeTab = $(this).attr("rel"); 
				$("#"+activeTab).parent().find(".tab_content").hide();
				$("#"+activeTab).fadeIn(); 
		  }).appendTo(ul);
	});
	$('<h2 class="icon-16"></h2>').addClass(entity+"-16").insertBefore(ul);
	$("li:first-child",ul).addClass("active");
	$("div:first-child",tabs).show();
};

const module = {};

module.init = (entity,title) => {
	app.ready(() => {
		page.form.entity = entity[0].toUpperCase() + entity.slice(1);
		page.form.init();
		$('#create').click(() => page.form.create());
		page.table.render(entity);
		page.search.init();
		page.table.details.title = title ? title : entity => {
			const names = Object.getOwnPropertyNames(entity);
			return entity[names[1]] + " " + entity[names[2]];
		};
		$("section > h1").addClass("icon-32").addClass(entity+"-32");
		$('<h1 class="icon-32"></h1>').addClass(entity+"-32").insertBefore("#wizard");
		$("#selection span").addClass("icon-16").addClass(entity+"-16");
		page.tabs.init(entity);
	});
};

app.ready(() => {
	
	$("body").click(() => {
		$(".focus").removeClass("focus");
		$("#contextmenu").hide()
	});
	
	$("body").append('<div id="confirm-dialog-container">'+
			'<div><span>Confirmation</span>'+
			'<span>Are you sure you want to delete this item?</span>'+
			'<a id="confirm-dialog-cancel" tabindex="2">Cancel</a>'+
			'<a id="confirm-dialog-ok" tabindex="1">OK</a></div></div>');
	
	$("body").append('<div id="alert-dialog-container">'+
			'<div><span>Alert</span><span></span>'+
			'<a id="alert-dialog-ok">OK</a></div></div>');
	
	$("#confirm-dialog-cancel").click(() => $("#confirm-dialog-container").hide());
	
	$("#alert-dialog-ok").click(() => $("#alert-dialog-container").hide());
	
	$("#confirm-dialog-container").on('keydown', function(event) {     
	        switch (event.keyCode) {
	            case 27:
	            	$(this).hide();
	                break;
	            case 9:
	            	const element = document.activeElement == $("#confirm-dialog-ok")[0] ? $("#confirm-dialog-cancel") : $("#confirm-dialog-ok"); 
	            	element.focus();
	                break;
	            case 13:
	            	$(document.activeElement).click();
	                break;
	        }
	       return false;
	 }); 
});