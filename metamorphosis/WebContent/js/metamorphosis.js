var app = {};
app.get = function(url,callback) {
	  app.wait();
	  $.ajax({
     type        : 'GET',
     url         : app.apiURL+url,
     dataType    : 'json'
    }).done(function(data) {
  	 app.release();
	     callback(data);
    }).fail(function(data) {
  	  app.release();
   });
};
app.post = function(url,formData,callback) {
	  app.wait();
	  $.ajax({
          type        : 'POST',
          url         : app.apiURL+url,
          data        : formData,
          dataType    : 'json'
      }).done(function(data) {
    	  app.release();
    	  callback(data);
      }).fail(function(data) {
    	  app.release();
      });
};

app.put = function(url,formData,callback) {
	  app.wait();
	  $.ajax({
        type        : 'PUT',
        url         : app.apiURL+url,
        data        : formData,
        dataType    : 'json'
    }).done(function(data) {
  	  app.release();
  	  callback(data);
    }).fail(function(data) {
  	  app.release();
    });
};


app.delete = function(url,callback) {
	  app.wait();
	  $.ajax({
      type        : 'DELETE',
      url         : app.apiURL+url,
      dataType    : 'json'
  }).done(function(data) {
	  app.release();
	  callback(data);
  }).fail(function(data) {
	  app.release();
  });
};

app.wait = function() {
	$(".wait").show();
};

app.release = function() {
	$(".wait").hide();
};

app.ready = function(callback) {
	$(function() {
        callback();
	});
};

app.pdf = function(url,callback) {
	head.load("js/pdfmake.min.js", "js/vfs_fonts.js", function() {
		app.get(url,function(data){
			 callback(data);
		});
	 });
};

var print = function(entity) {
	pdfMake.createPdf(doc(entity)).print();
};

var pdf = function(entity) {
	pdfMake.createPdf(doc(entity)).open();
};

var page = {};
page.animate = function(element) {
	element.shake(1,100);
};
page.list = {};
page.list.bind = function() {
	page.list.bindRow("list tbody tr");
    $("#list").unbind('keydown').on('keydown', function (e) {      
    	var index = page.list.selectedRow.element.index();
    	var element =  $('#list tbody tr.focus');
    	if(element.length) index = element.index();
    	var start = index;
    	$('#list tbody tr').removeClass("focus");
        switch (e.keyCode) {
            case 40: // down
                index++;
                break;
            case 38: // up
                index--;
                break;
            case 46: // up
            	page.confirmDialog.confirm(function(){
            		var element = $('#list tbody tr').eq(index);
            		var row = {id:element.attr("id"),element:element};
        			page.list.removeRow(row);
            	});
                break;
            case 13: // enter
            	$('#list tbody tr').eq(index).click();
                break;
        }
        var size = $('#list tbody tr').length;
        if(index==-1) {
        	$('#list tbody tr').eq(0).addClass('focus');   
        }else if(index == size) {
        	$('#list tbody tr').eq(size-1).addClass('focus');
        }else {
        	var row = $('#list tbody tr').eq(index);
        	if (row.css('display') == 'none' ){
        		var number = $(".page-number.active").text();
        		if(index > start) {
      			  $(".page-number").eq(number).click();
      			} else {
      				$(".page-number").eq(number-2).click();
      			}
        	}
        	row.addClass('focus');   
        }
    }); 
};
page.list.bindRow = function(element) {
	$("#"+element).unbind("click").click(function(event){
		$("#list tr.active").removeClass("active");
		$("#list tr.focus").removeClass("focus");
		var row = $(this);
		$("#list").focus();
		row.addClass("active").addClass("focus");
		$("#selection").hide();
		var details = $("#details").show();
		var id = row.attr("id");
		app.get(page.list.url+"/"+id,function(data){
			page.list.selectedRow = {id:id,data:data,element:row};
			page.list.details.show(data,details);
			var activeTab = $("ul.tabs li.active").attr("rel");
			page.animate($("#"+activeTab));
		});
		return false;
		
	}).contextmenu(function(event){
		$("#list tr.focus").removeClass("focus");
		$(this).addClass("focus");
		var row = $(this);
		var id = row.attr("id");
		var top = $(this).position().top;
		var left = event.pageX;
		if(left>window.innerWidth-100) {
			left = window.innerWidth -200;
		}
		$("#contextmenu").show().css({top : top+10, left:left});
	    return false;
	});
	
};

page.list.removeRow = function(row){
	app.delete(page.list.url+"/"+row.id,function(data){
		var next = row.element.next();
		if(next.length) {
			next.click();
		} else {
			 row.element.prev().click();
		}
		row.element.remove();
		if($("#list tbody tr").length==0) {
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
page.list.render = function(url,message,callback) {
	page.list.url = url;
	page.list.message = message;
	$("#list").attr("tabindex","1").click(function(event){
		$("#contextmenu").hide();
		return false;
	});
	$("#form").on("submit",function(){
		return false;
	});
	$('#search input').val("").focus();
	$('#search').submit(function(){
	     var value =  $('input',this).val();
	     if(value.trim() == '') {
	   	   alert("enter your search");
	   	   $('input',this).focus();
	   	   return false;
	     } 
	     var formData = $(this).serialize();
		 app.post(page.list.url+"/search",formData,function(data){
			page.render({element:"list tbody",data:data},function(){
				page.list.bind();
				page.list.contextmenu();
				page.list.paginate();
				$("#details").hide();
				$("#selection").show();
			});
			
		 });
		return false;
	});
	app.get(url,function(data){
		page.render({element:"list tbody",data:data},function(){
			page.list.bind();
			if($("#list tbody tr").length==0) {
				var size = $("#list th").length;
				$('#list tbody').append("<tr class='empty'><td valign='top' colspan='"+size+"'>"+message+"</td></tr>");
			} else {
				$("#selection").slideDown(500);
				page.list.contextmenu();
			}
			if(callback)callback();
		});
		
	});
	
};

page.list.contextmenu = function(callback) {
	page.list.callback = page.list.callback ? page.list.callback : callback;
	page.list.bindContextmenu("list tbody tr",page.list.callback);
};

page.list.bindContextmenu = function(element,callback) {
	$("#"+element).contextmenu(function(event){
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
			app.pdf(page.list.url+"/"+id,function(data){
  				print(data);
  			});
		});
		$(".pdf-16",contextmenu).click(function(event){
			app.pdf(page.list.url+"/"+id,function(data){
  				pdf(data);
  			});
		});
		if(callback)callback(row,$("#contextmenu"));
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

page.list.addRow = function(data) {
	$('#list tbody tr.empty').remove();
	page.render({element:"list tbody",data:data,append:true},function(){
		page.list.paginate();
		page.list.bindRow("list tbody tr:last");
		page.list.bindContextmenu("list tbody tr:last",page.list.callback);
		$("span.page-number:last").click();
		$("#list tbody tr:last").attr("id","1455555").click();
	});
	
};

page.list.updateRow = function(data) {
	var container = $("<div/>");
	page.render({element:"list tbody",data:data,container:container},function(){
		page.list.selectedRow.element.html($("tr",container).html());
		page.list.selectedRow.element.click();
	});
};

page.list.paginate = function() {
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
page.list.details.setTitle = function(title){
	$("#details > h2").html(title);
	$("#details > h2").append("<a title='Edit' class='edit-16'></a>");
	 $("#details > h2 a.edit-16").click(function(event){
		 app.get(page.list.url+"/"+page.list.selectedRow.id,function(data){
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
  			app.pdf(page.list.url+"/"+page.list.selectedRow.id,function(data){
  				print(data);
  			});
 			return false;
 	    });
  	 }
  	 $("#details > h2").append("<a title='PDF' class='pdf-16'></a>");
	 $("#details > h2 a.pdf-16").click(function(event){
		 app.pdf(page.list.url+"/"+page.list.selectedRow.id,function(data){
  				pdf(data);
  		});
			return false;
	});
};
page.list.details.addButton = function(title,icon){
	return $("#details > h2").append("<a title='"+title+"' class='"+icon+"'></a>");
};

page.list.details.render = function(list,data){
	for(var i=0;i<list.length;i++) {
		page.render({element:list[i],data:data});
	}
};

page.form = {};
page.form.submit = function() {
	if(!page.edit) {
		 var formData = $("#form").serialize();
		 app.post(page.list.url,formData,function(data){
			 page.list.addRow([data]);
			 return false;
		 });
	}else {
		var formData = $("#form").serialize();
		 app.put(page.list.url,formData,function(data){
			 page.list.updateRow([data]);
		 });
	}
	page.edit = false;
};
page.form.create = function() {
	page.edit = false;
	$('#new').click();
};
page.render = function(object,callback) {
	app.templates = app.templates ? app.templates : {};
	var source = app.templates[object.element];
	var script = $("script","#"+object.element);
	if(!source) {
		source = app.templates[object.element] = {template:script.html(),type:script.attr("type")};
	}
	var render = function(element,html,container) {
		if(!container) {
			element = object.append ? $("#"+element).append(html) : $("#"+element).html(html);
			$("fieldset span:even",element).addClass("text-right");
		}else {
			object.append ? container.append(html) : container.html(html);
			$("fieldset span:even",container).addClass("text-right");
		}
	}
	if(source.type == "text/x-handlebars-template") {
		head.load("js/handlebars-v4.0.5.js", function() {
			 var template = Handlebars.compile(source.template);
			 render(object.element,template(object.data),object.container);
			 if(callback) callback();
		});
	}else if(source.type == "text/x-dust-template") {
		head.load("js/dust-full.min.js", function() {
			 dust.renderSource(source.template,object.data, function(err, out) {
				 render(object.element,out,object.container);
			 });
			 if(callback) callback();
		});
	}
	
};

var module = {};
module.init = function(entity) {
	app.ready(function(){
		page.form.entity = entity[0].toUpperCase() + entity.slice(1);
		if($("#form").length==1)page.form.init();
		if($("#list").length==1){
			$('#new').click(function(){
				$('.form h1').html("Create "+page.form.entity +" : Informations");
				$('.form input:not([type=hidden]').val("");
				$('#form').removeClass("hide");
				page.edit = false;
				return false;
			});
			page.list.render(entity+"s","no "+entity);
		}
	});
};

window.addEventListener('offline', function(){
	var div = $("<div class='modal'/>").appendTo($("body"));
	div.append("<span>You are currently offline</span>");
	app.wait();
});

window.addEventListener('online', function(){
	$("div.modal").remove();
	app.release();
});

var isChrome = !!window.chrome && !!window.chrome.webstore;

page.confirmDialog = {};
page.confirmDialog.confirm = function(callback) {
	$("#contextmenu").hide();
	$(".confirm-dialog-container").show();
	$("#confirm-dialog-ok").unbind("click").click(function(event){
		$(".confirm-dialog-container").hide();
		callback();
	}).focus();
	
};

var alert = function(message) {
	$(".alert-dialog-message").html(message);
	$(".alert-dialog-container").show();
};
app.ready(function(){
	
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

jQuery.fn.shake =
	jQuery.fn.wiggle = function (times, duration, easing, complete) {
	    var self = this;

	    if (times > 0) {
	        this.animate({
	            marginLeft: times-- % 2 === 0 ? -15 : 15
	        }, duration, easing, function () {
	            self.wiggle(times, duration, easing, complete);
	        });
	    } else {
	        this.animate({
	            marginLeft: 0
	        }, duration, easing, function () {
	            if (jQuery.isFunction(complete)) {
	                complete();
	            }
	        });
	    }
	    return this;
	};

/*! head.core - v1.0.2 */
(function(n,t){"use strict";function r(n){a[a.length]=n}function k(n){var t=new RegExp(" ?\\b"+n+"\\b");c.className=c.className.replace(t,"")}function p(n,t){for(var i=0,r=n.length;i<r;i++)t.call(n,n[i],i)}function tt(){var t,e,f,o;c.className=c.className.replace(/ (w-|eq-|gt-|gte-|lt-|lte-|portrait|no-portrait|landscape|no-landscape)\d+/g,"");t=n.innerWidth||c.clientWidth;e=n.outerWidth||n.screen.width;u.screen.innerWidth=t;u.screen.outerWidth=e;r("w-"+t);p(i.screens,function(n){t>n?(i.screensCss.gt&&r("gt-"+n),i.screensCss.gte&&r("gte-"+n)):t<n?(i.screensCss.lt&&r("lt-"+n),i.screensCss.lte&&r("lte-"+n)):t===n&&(i.screensCss.lte&&r("lte-"+n),i.screensCss.eq&&r("e-q"+n),i.screensCss.gte&&r("gte-"+n))});f=n.innerHeight||c.clientHeight;o=n.outerHeight||n.screen.height;u.screen.innerHeight=f;u.screen.outerHeight=o;u.feature("portrait",f>t);u.feature("landscape",f<t)}function it(){n.clearTimeout(b);b=n.setTimeout(tt,50)}var y=n.document,rt=n.navigator,ut=n.location,c=y.documentElement,a=[],i={screens:[240,320,480,640,768,800,1024,1280,1440,1680,1920],screensCss:{gt:!0,gte:!1,lt:!0,lte:!1,eq:!1},browsers:[{ie:{min:6,max:11}}],browserCss:{gt:!0,gte:!1,lt:!0,lte:!1,eq:!0},html5:!0,page:"-page",section:"-section",head:"head"},v,u,s,w,o,h,l,d,f,g,nt,e,b;if(n.head_conf)for(v in n.head_conf)n.head_conf[v]!==t&&(i[v]=n.head_conf[v]);u=n[i.head]=function(){u.ready.apply(null,arguments)};u.feature=function(n,t,i){return n?(Object.prototype.toString.call(t)==="[object Function]"&&(t=t.call()),r((t?"":"no-")+n),u[n]=!!t,i||(k("no-"+n),k(n),u.feature()),u):(c.className+=" "+a.join(" "),a=[],u)};u.feature("js",!0);s=rt.userAgent.toLowerCase();w=/mobile|android|kindle|silk|midp|phone|(windows .+arm|touch)/.test(s);u.feature("mobile",w,!0);u.feature("desktop",!w,!0);s=/(chrome|firefox)[ \/]([\w.]+)/.exec(s)||/(iphone|ipad|ipod)(?:.*version)?[ \/]([\w.]+)/.exec(s)||/(android)(?:.*version)?[ \/]([\w.]+)/.exec(s)||/(webkit|opera)(?:.*version)?[ \/]([\w.]+)/.exec(s)||/(msie) ([\w.]+)/.exec(s)||/(trident).+rv:(\w.)+/.exec(s)||[];o=s[1];h=parseFloat(s[2]);switch(o){case"msie":case"trident":o="ie";h=y.documentMode||h;break;case"firefox":o="ff";break;case"ipod":case"ipad":case"iphone":o="ios";break;case"webkit":o="safari"}for(u.browser={name:o,version:h},u.browser[o]=!0,l=0,d=i.browsers.length;l<d;l++)for(f in i.browsers[l])if(o===f)for(r(f),g=i.browsers[l][f].min,nt=i.browsers[l][f].max,e=g;e<=nt;e++)h>e?(i.browserCss.gt&&r("gt-"+f+e),i.browserCss.gte&&r("gte-"+f+e)):h<e?(i.browserCss.lt&&r("lt-"+f+e),i.browserCss.lte&&r("lte-"+f+e)):h===e&&(i.browserCss.lte&&r("lte-"+f+e),i.browserCss.eq&&r("eq-"+f+e),i.browserCss.gte&&r("gte-"+f+e));else r("no-"+f);r(o);r(o+parseInt(h,10));i.html5&&o==="ie"&&h<9&&p("abbr|article|aside|audio|canvas|details|figcaption|figure|footer|header|hgroup|main|mark|meter|nav|output|progress|section|summary|time|video".split("|"),function(n){y.createElement(n)});p(ut.pathname.split("/"),function(n,u){if(this.length>2&&this[u+1]!==t)u&&r(this.slice(u,u+1).join("-").toLowerCase()+i.section);else{var f=n||"index",e=f.indexOf(".");e>0&&(f=f.substring(0,e));c.id=f.toLowerCase()+i.page;u||r("root"+i.section)}});u.screen={height:n.screen.height,width:n.screen.width};tt();b=0;n.addEventListener?n.addEventListener("resize",it,!1):n.attachEvent("onresize",it)})(window);
/*! head.css3 - v1.0.0 */
(function(n,t){"use strict";function a(n){for(var r in n)if(i[n[r]]!==t)return!0;return!1}function r(n){var t=n.charAt(0).toUpperCase()+n.substr(1),i=(n+" "+c.join(t+" ")+t).split(" ");return!!a(i)}var h=n.document,o=h.createElement("i"),i=o.style,s=" -o- -moz- -ms- -webkit- -khtml- ".split(" "),c="Webkit Moz O ms Khtml".split(" "),l=n.head_conf&&n.head_conf.head||"head",u=n[l],f={gradient:function(){var n="background-image:";return i.cssText=(n+s.join("gradient(linear,left top,right bottom,from(#9f9),to(#fff));"+n)+s.join("linear-gradient(left top,#eee,#fff);"+n)).slice(0,-n.length),!!i.backgroundImage},rgba:function(){return i.cssText="background-color:rgba(0,0,0,0.5)",!!i.backgroundColor},opacity:function(){return o.style.opacity===""},textshadow:function(){return i.textShadow===""},multiplebgs:function(){i.cssText="background:url(https://),url(https://),red url(https://)";var n=(i.background||"").match(/url/g);return Object.prototype.toString.call(n)==="[object Array]"&&n.length===3},boxshadow:function(){return r("boxShadow")},borderimage:function(){return r("borderImage")},borderradius:function(){return r("borderRadius")},cssreflections:function(){return r("boxReflect")},csstransforms:function(){return r("transform")},csstransitions:function(){return r("transition")},touch:function(){return"ontouchstart"in n},retina:function(){return n.devicePixelRatio>1},fontface:function(){var t=u.browser.name,n=u.browser.version;switch(t){case"ie":return n>=9;case"chrome":return n>=13;case"ff":return n>=6;case"ios":return n>=5;case"android":return!1;case"webkit":return n>=5.1;case"opera":return n>=10;default:return!1}}};for(var e in f)f[e]&&u.feature(e,f[e].call(),!0);u.feature()})(window);
/*! head.load - v1.0.3 */
(function(n,t){"use strict";function w(){}function u(n,t){if(n){typeof n=="object"&&(n=[].slice.call(n));for(var i=0,r=n.length;i<r;i++)t.call(n,n[i],i)}}function it(n,i){var r=Object.prototype.toString.call(i).slice(8,-1);return i!==t&&i!==null&&r===n}function s(n){return it("Function",n)}function a(n){return it("Array",n)}function et(n){var i=n.split("/"),t=i[i.length-1],r=t.indexOf("?");return r!==-1?t.substring(0,r):t}function f(n){(n=n||w,n._done)||(n(),n._done=1)}function ot(n,t,r,u){var f=typeof n=="object"?n:{test:n,success:!t?!1:a(t)?t:[t],failure:!r?!1:a(r)?r:[r],callback:u||w},e=!!f.test;return e&&!!f.success?(f.success.push(f.callback),i.load.apply(null,f.success)):e||!f.failure?u():(f.failure.push(f.callback),i.load.apply(null,f.failure)),i}function v(n){var t={},i,r;if(typeof n=="object")for(i in n)!n[i]||(t={name:i,url:n[i]});else t={name:et(n),url:n};return(r=c[t.name],r&&r.url===t.url)?r:(c[t.name]=t,t)}function y(n){n=n||c;for(var t in n)if(n.hasOwnProperty(t)&&n[t].state!==l)return!1;return!0}function st(n){n.state=ft;u(n.onpreload,function(n){n.call()})}function ht(n){n.state===t&&(n.state=nt,n.onpreload=[],rt({url:n.url,type:"cache"},function(){st(n)}))}function ct(){var n=arguments,t=n[n.length-1],r=[].slice.call(n,1),f=r[0];return(s(t)||(t=null),a(n[0]))?(n[0].push(t),i.load.apply(null,n[0]),i):(f?(u(r,function(n){s(n)||!n||ht(v(n))}),b(v(n[0]),s(f)?f:function(){i.load.apply(null,r)})):b(v(n[0])),i)}function lt(){var n=arguments,t=n[n.length-1],r={};return(s(t)||(t=null),a(n[0]))?(n[0].push(t),i.load.apply(null,n[0]),i):(u(n,function(n){n!==t&&(n=v(n),r[n.name]=n)}),u(n,function(n){n!==t&&(n=v(n),b(n,function(){y(r)&&f(t)}))}),i)}function b(n,t){if(t=t||w,n.state===l){t();return}if(n.state===tt){i.ready(n.name,t);return}if(n.state===nt){n.onpreload.push(function(){b(n,t)});return}n.state=tt;rt(n,function(){n.state=l;t();u(h[n.name],function(n){f(n)});o&&y()&&u(h.ALL,function(n){f(n)})})}function at(n){n=n||"";var t=n.split("?")[0].split(".");return t[t.length-1].toLowerCase()}function rt(t,i){function e(t){t=t||n.event;u.onload=u.onreadystatechange=u.onerror=null;i()}function o(f){f=f||n.event;(f.type==="load"||/loaded|complete/.test(u.readyState)&&(!r.documentMode||r.documentMode<9))&&(n.clearTimeout(t.errorTimeout),n.clearTimeout(t.cssTimeout),u.onload=u.onreadystatechange=u.onerror=null,i())}function s(){if(t.state!==l&&t.cssRetries<=20){for(var i=0,f=r.styleSheets.length;i<f;i++)if(r.styleSheets[i].href===u.href){o({type:"load"});return}t.cssRetries++;t.cssTimeout=n.setTimeout(s,250)}}var u,h,f;i=i||w;h=at(t.url);h==="css"?(u=r.createElement("link"),u.type="text/"+(t.type||"css"),u.rel="stylesheet",u.href=t.url,t.cssRetries=0,t.cssTimeout=n.setTimeout(s,500)):(u=r.createElement("script"),u.type="text/"+(t.type||"javascript"),u.src=t.url);u.onload=u.onreadystatechange=o;u.onerror=e;u.async=!1;u.defer=!1;t.errorTimeout=n.setTimeout(function(){e({type:"timeout"})},7e3);f=r.head||r.getElementsByTagName("head")[0];f.insertBefore(u,f.lastChild)}function vt(){for(var t,u=r.getElementsByTagName("script"),n=0,f=u.length;n<f;n++)if(t=u[n].getAttribute("data-headjs-load"),!!t){i.load(t);return}}function yt(n,t){var v,p,e;return n===r?(o?f(t):d.push(t),i):(s(n)&&(t=n,n="ALL"),a(n))?(v={},u(n,function(n){v[n]=c[n];i.ready(n,function(){y(v)&&f(t)})}),i):typeof n!="string"||!s(t)?i:(p=c[n],p&&p.state===l||n==="ALL"&&y()&&o)?(f(t),i):(e=h[n],e?e.push(t):e=h[n]=[t],i)}function e(){if(!r.body){n.clearTimeout(i.readyTimeout);i.readyTimeout=n.setTimeout(e,50);return}o||(o=!0,vt(),u(d,function(n){f(n)}))}function k(){r.addEventListener?(r.removeEventListener("DOMContentLoaded",k,!1),e()):r.readyState==="complete"&&(r.detachEvent("onreadystatechange",k),e())}var r=n.document,d=[],h={},c={},ut="async"in r.createElement("script")||"MozAppearance"in r.documentElement.style||n.opera,o,g=n.head_conf&&n.head_conf.head||"head",i=n[g]=n[g]||function(){i.ready.apply(null,arguments)},nt=1,ft=2,tt=3,l=4,p;if(r.readyState==="complete")e();else if(r.addEventListener)r.addEventListener("DOMContentLoaded",k,!1),n.addEventListener("load",e,!1);else{r.attachEvent("onreadystatechange",k);n.attachEvent("onload",e);p=!1;try{p=!n.frameElement&&r.documentElement}catch(wt){}p&&p.doScroll&&function pt(){if(!o){try{p.doScroll("left")}catch(t){n.clearTimeout(i.readyTimeout);i.readyTimeout=n.setTimeout(pt,50);return}e()}}()}i.load=i.js=ut?lt:ct;i.test=ot;i.ready=yt;i.ready(r,function(){y()&&u(h.ALL,function(n){f(n)});i.feature&&i.feature("domloaded",!0)})})(window);
/*
//# sourceMappingURL=head.min.js.map
*/