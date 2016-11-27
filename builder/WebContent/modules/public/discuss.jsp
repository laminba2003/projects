<h1 class="discuss-16">Room : <span id="room">General</span> 
<select id="changeroom" onchange="changeRoom();">
	<option value="General">General</option>
</select>
</h1>
<div id="content">
<div class="chat">
	<div class="chat-left">
				
	</div>
	<div class="chat-right">
		<h2>Connected</h2>
		<div id="users">
		</div>
	</div>
	<div class="chat-bottom">
	   <h3>Enter your message : </h3>
		<textarea id="message" rows="2"></textarea>
		<input id="do-chat" type="submit" value="Send"/>
	</div>
</div>
</div>
<script>
	var wsocket;
	var serviceLocation =  "ws://" + "env-3511481.cloudhosting.rsaweb.co.za/chat/"+"chat/";
	var user = "user";

	function onopen(evt) {
		$(".wait").hide();
		var msg = '{"message":"' + user + " vient de se connecter" + '", "sender":"'
		+ user + '", "received":""}';
		wsocket.send(msg);
	}
	function onMessageReceived(evt) {
 		if(evt.data.startsWith("[")) {
			var text = evt.data.substr(1,evt.data.length-2);
			var data = text.split(",");
			$("div#users").empty();
			$.each(data, function( index, value ) {
				var span = $("<span class='message-info-user-name'/>");
				span.html(value);
				if(value.trim() == user.trim()) {
					span.addClass("user-chat-selected");
				}
				$("div#users").append(span);
			});
			
		} else {
			var msg = JSON.parse(evt.data);
			var date = new Date(msg.received);
			var time = date.toTimeString().replace(/.*(\d{2}:\d{2}:\d{2}).*/, "$1");
			var $messageLine = $('<div class="message-info"><div class="message-info-user">' 
					+ "<span class='message-info-user-name'>"+msg.sender+"</span>"
					+ "<span class='message-info-time'>"+time+"</span>"
					+'</div>'+"<div class='message-info-content'>"+
					'<p>'+msg.message+'</p>'+
					"</div>"+'</div>');
			$(".chat-left").append($messageLine);
			}
	}
	function sendMessage() {
		var val = $("#message").val();
		if(val.trim() == '') {
			alert("entrez votre message");
		} else {
			var msg = '{"message":"' + val + '", "sender":"'
					+ user + '", "received":""}';
			wsocket.send(msg);
			$("#message").val('').focus();
		}
	}

	function connectToChatserver(room) {
		$(".wait").show();
		$("#changeroom").val(room);
		wsocket = new WebSocket(serviceLocation + room+"/"+user);
		wsocket.onmessage = onMessageReceived;
		wsocket.onopen = onopen;
		wsocket.onerror = function(evt) {
			$(".wait").hide();
			alert("error while connecting to the chat room "+room);
        };
	}

	function changeRoom() {
		var room = $("#changeroom").val();
		$("#room").html(room);
		$(".chat-left").empty();
		wsocket.close();
		connectToChatserver(room);
	}
	connectToChatserver("General");
	setInterval(function(){ 
		var msg = '{"message":"' + "users" + '", "sender":"'
		+ "user" + '", "received":""}';
		wsocket.send(msg);
	}, 2000);
</script>