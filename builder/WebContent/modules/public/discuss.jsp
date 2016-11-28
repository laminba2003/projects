<h1 class="discuss-16">Discuss</h1>
<div class="chat">
<h2>Chat Room : <select id="changeroom" onchange="changeRoom();">
	<option value="general">general</option>
	<option value="developers">developers</option>
	<option value="designers">designers</option>
</select></h2>
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
<script>
	var wsocket;
	var serviceLocation =  "ws://" + "localhost:8080/chat/"+"chat/";
	var user = "user";

	function onopen(evt) {
		app.release();
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
			alert("enter your message");
		} else {
			var msg = '{"message":"' + val + '", "sender":"'
					+ user + '", "received":""}';
			wsocket.send(msg);
			alert(msg);
			$("#message").val('').focus();
		}
	}

	function connectToChatserver(room) {
		app.wait();
		$("#changeroom").val(room);
		wsocket = new WebSocket(serviceLocation + room+"/"+user);
		wsocket.onmessage = onMessageReceived;
		wsocket.onopen = onopen;
		wsocket.onerror = function(evt) {
			app.release();
			alert("cannot connect to the chat room "+room);
        };
	}

	function changeRoom() {
		var room = $("#changeroom").val();
		$(".chat-left").empty();
		wsocket.close();
		connectToChatserver(room);
	}
	app.ready(function(){
		connectToChatserver("general");
		setInterval(function(){ 
			var msg = '{"message":"' + "users" + '", "sender":"'
			+ "user" + '", "received":""}';
			wsocket.send(msg);
		}, 2000);
		$('#do-chat').click(function(evt) {
			sendMessage();
			evt.preventDefault();
		});
	});
</script>