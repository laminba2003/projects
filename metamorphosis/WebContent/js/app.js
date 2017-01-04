app.apiURL = "http://env-4347792.mircloud.host/";

page.table = {};

page.table.render = entity => {
	page.table.init(entity);
	app.get(page.table.url, entities => page.render($("tbody"), entities, page.table.display));
};

page.table.init = entity => {
	page.table.url = app.apiURL+entity+"s";
	page.table.message = "no "+entity;
	$("#contextmenu .new-16").click(() => page.form.create());
	$("#contextmenu .row-select").click(() => page.table.selectedRow.element.click());
	$("#contextmenu .edit-16").click(() => {
		app.get(page.table.url+"/"+page.table.selectedRow.id, entity => {
			deserialize($(".form"),entity);
			page.form.edit(entity);
			page.edit = true;
		});
	});
	$("#contextmenu .delete-16").click(() => confirm(() => page.table.removeRow(page.table.selectedRow)));
	$("#contextmenu .print-16").click(() => page.print(page.table.url+"/"+page.table.selectedRow.id));
	$("#contextmenu .pdf-16").click(() => page.pdf(page.table.url+"/"+page.table.selectedRow.id));
};

page.table.display = rows => {
	if(!rows.length) {
		$('tbody').append("<tr class='empty'><td valign='top' colspan='"+$("th").length+"'>"+page.table.message+"</td></tr>");
	} else {
		page.table.bindRow(rows);
		page.table.paginate();
		page.table.details.hide(true);
	}
};

page.table.bindRow = element => {
	element.click(function(event){
		$("tr.active").removeClass("active");
		$("tr.focus").removeClass("focus");
		const row = $(this).addClass("active").addClass("focus");
		const id = row.attr("id");
		app.get(page.table.url+"/"+id, entity => {
			page.table.selectedRow = {id:id,element:row};
			page.table.details.show(entity,page.table.selectedRow);
		});
		return false;
	}).contextmenu(function(event){
		$("tr.focus").removeClass("focus");
		const row = $(this).addClass("focus");
		page.table.selectedRow = {id:row.attr("id"),element:row};
		const top = row.position().top;
		const left = event.pageX;
		if(left>window.innerWidth-100) {
			left = window.innerWidth -200;
		}
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
			$('tbody').append("<tr class='empty'><td  valign='top' colspan='"+$("th").length+"'>"+page.table.message+"</td></tr>");
			page.table.details.hide(true);
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

function deserialize(form, entity) {
	  $.each(entity, function(key, value){
	    $('[name='+key+']', form).val(value);
	    if(value === Object(value)) {
	    	$.each(value, function(k, val){
	    	    $('[name='+key+"\\["+k+'\\]]', form).val(val);
	    	 });
	    }
	  });
};

page.table.addRow = entity => {
	$('tr.empty').remove();
	page.render($("tbody"), [entity], true, row => {
		page.table.paginate();
		page.table.bindRow(row);
		$("span.page-number:last").click();
		row.attr("id","1455555").click();
	});
	
};

page.table.updateRow = entity => {
	const container = $("<div/>");
	page.render($("tbody"), [entity] ,false, container, row => {
		page.table.selectedRow.element.html($("tr",container).html());
		page.table.selectedRow.element.click();
	});
};

page.table.paginate = () => {
	$('table').unbind("repaginate");
	$('table').each(function() {
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
	$.each($("div.tab_container > div"),(i, element) => page.render($(element),entity));
	$("#details > h2").html("Details "+page.form.entity + " : " +title(entity));
	$("#details > h2").append("<a title='Edit' class='edit-16'></a>");
	$("#details > h2 a.edit-16").click(() => {
		 app.get(page.table.url+"/"+row.id,entity => {
				deserialize($(".form"),entity);
				page.form.edit(entity);
				page.edit = true;
				const number = Math.floor(page.table.selectedRow.element.index() / 7);
				$(".page-number").eq(number).click();
			});
	      return false;
	});
	$("#details > h2").append("<a title='Delete' class='delete-16'></a>");
	$("#details > h2 a.delete-16").click(() => {
		confirm(() => {
			 page.table.removeRow(row);
			 const number = Math.floor(page.table.selectedRow.element.index() / 7);
			 $(".page-number").eq(number).click();
		});
		return false;
	});
	if(isChrome) {
  		$("#details > h2").append("<a title='Imprimer' class='print-16'></a>");
  		$("#details > h2 a.print-16").click(() => {
  			page.print(page.table.url+"/"+row.id);
 			return false;
 	    });
  	}
  	$("#details > h2").append("<a title='PDF' class='pdf-16'></a>");
	$("#details > h2 a.pdf-16").click(() => {
		 page.pdf(page.table.url+"/"+row.id);
		 return false;
	});
	page.table.details.hide(false);
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
	     if(!$('input',this).val().trim()) {
	    	 alert("enter your search");
	    	 return false;
	     }
	     const entity = $(this).serialize();
		 app.post(page.table.url+"/search",entity, entities => page.render($("tbody"), entities, page.table.display));
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
	$('#create').click();
};

const module = {};

module.init = entity => {
	app.ready(() => {
		page.form.entity = entity[0].toUpperCase() + entity.slice(1);
		page.form.init();
		$('#create').click(() => {
			$('.form h1').html("Create "+page.form.entity +" : Informations");
			$('.form')[0].reset();
			page.edit = false;
			return false;
		});
		page.table.render(entity);
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