app.apiURL = "http://env-4347792.mircloud.host/";

page.list = {};

page.list.render = (url,message) => {
	page.list.init(url,message);
	app.get(page.list.url, entities => {
		page.render($("tbody"), entities, rows => {
			page.list.display(rows);
		});
	});
};

page.list.init = (url,message) => {
	page.list.url = app.apiURL+url;
	page.list.message = message;
	$("#contextmenu .new-16").click(() => page.form.create());
	$("#contextmenu .row-select").click(() => page.list.selectedRow.element.click());
	$("#contextmenu .edit-16").click(() => {
		app.get(page.list.url+"/"+page.list.selectedRow.id, entity => {
			deserialize($(".form"),entity);
			page.form.edit(entity);
			page.edit = true;
		});
	});
	$("#contextmenu .delete-16").click(() => confirm(() => page.list.removeRow(page.list.selectedRow)));
	$("#contextmenu .print-16").click(() => page.print(page.list.url+"/"+page.list.selectedRow.id));
	$("#contextmenu .pdf-16").click(() => page.pdf(page.list.url+"/"+page.list.selectedRow.id));
};

page.list.display = rows => {
	if(!rows.length) {
		$('tbody').append("<tr class='empty'><td valign='top' colspan='"+$("th").length+"'>"+page.list.message+"</td></tr>");
	} else {
		page.list.bindRow(rows);
		page.list.paginate();
		$("#details").hide();
		$("#selection").slideDown(500);
	}
};

page.list.bindRow = element => {
	element.click(function(event){
		$("tr.active").removeClass("active");
		$("tr.focus").removeClass("focus");
		$("table").focus();
		const row = $(this);
		row.addClass("active").addClass("focus");
		$("#selection").hide();
		const details = $("#details").show();
		const id = row.attr("id");
		app.get(page.list.url+"/"+id, entity => {
			page.list.selectedRow = {id:id,data:entity,element:row};
			page.list.details.show(entity);
		});
		return false;
	}).contextmenu(function(event){
		$("tr.focus").removeClass("focus");
		const row = $(this).addClass("focus");
		page.list.selectedRow = {id:row.attr("id"),element:row};
		const top = row.position().top;
		const left = event.pageX;
		if(left>window.innerWidth-100) {
			left = window.innerWidth -200;
		}
		$("#contextmenu").show().css({top : top+10, left:left});
	    return false;
	});
	
};

page.list.removeRow = row => {
	app.delete(page.list.url+"/"+row.id, () => {
		const next = row.element.next();
		next.length ? next.click() : row.element.prev().click();
		row.element.remove();
		if(!$("tbody tr").length) {
			$('tbody').append("<tr class='empty'><td  valign='top' colspan='"+$("th").length+"'>"+page.list.message+"</td></tr>");
			$("#details").hide();
			$("#selection").hide();
		}else {
			const number = $(".page-number.active").text();
			page.list.paginate();
			if(number <= $(".page-number").length) {
			  $(".page-number").eq(number-1).click();
			} else if(number > $(".page-number").length) {
				$(".page-number").eq(number-2).click();
			}
		}
	});
	
};


function deserialize(form, data) {
	  $.each(data, function(key, value){
	    $('[name='+key+']', form).val(value);
	    if(value === Object(value)) {
	    	$.each(value, function(k, val){
	    	    $('[name='+key+"\\["+k+'\\]]', form).val(val);
	    	 });
	    }
	  });
};

page.list.addRow = entity => {
	$('tr.empty').remove();
	page.render($("tbody"), entity, true, row => {
		page.list.paginate();
		page.list.bindRow(row);
		$("span.page-number:last").click();
		$(row).attr("id","1455555").click();
	});
	
};

page.list.updateRow = entity => {
	const container = $("<div/>");
	page.render($("tbody"), entity ,false, container, row => {
		page.list.selectedRow.element.html($("tr",container).html());
		page.list.selectedRow.element.click();
	});
};

page.list.paginate = () => {
	$('table').unbind("repaginate");
	$('table').each(function() {
		 $(".pager").remove();
	    var currentPage = 0;
	    const $table = $(this);
	    const numPerPage = $table.attr("data-rows")?$table.attr("data-rows") :7;
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

page.list.details = {};

page.list.details.setTitle = title => {
	$("#details > h2").html(title);
	$("#details > h2").append("<a title='Edit' class='edit-16'></a>");
	 $("#details > h2 a.edit-16").click(function(event){
		 app.get(page.list.url+"/"+page.list.selectedRow.id,data => {
				populate($(".form"),data);
				page.form.edit(data);
				page.edit = true;
				const number = Math.floor(page.list.selectedRow.element.index() / 7);
				$(".page-number").eq(number).click();
			});
	      return false;
	});
	 $("#details > h2").append("<a title='Delete' class='delete-16'></a>");
	 $("#details > h2 a.delete-16").click(function(event){
		confirm(function(){
			 page.list.removeRow(page.list.selectedRow);
				const number = Math.floor(page.list.selectedRow.element.index() / 7);
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

page.search = {};

page.list.details.show = function(entity) {
	page.list.details.setTitle("Details "+page.form.entity + " : " +title(entity));
	$.each($("div.tab_container > div"), function( i, element ){
		page.render($(element),entity);
	});
};

page.search.init = () => {
	$('#search input').val("").focus();
	$('#search').submit(function(){;
	     if(!$('input',this).val().trim()) {
	    	 alert("enter your search");
	    	 return false;
	     }
	     const data = $(this).serialize();
		 app.post(page.list.url+"/search",data, entities => {
			page.render($("tbody"), entities, rows => {
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

app.ready(() => {
	
	$(".tab_content").hide();
	$(".tab_container .tab_content:first-child").show(); 

	$("ul.tabs li").click(function() {
		const parent = $(this).parent();
		$("li",parent).removeClass("active");
		$(this).addClass("active");
		const activeTab = $(this).attr("rel"); 
		$("#"+activeTab).parent().find(".tab_content").hide();
		$("#"+activeTab).fadeIn(); 
	});
	
	$("body").click(() => $(".focus").removeClass("focus"));
	
});