<div id="logo"><a href="${path}"><img src="images/brain.png"/> <span>Think</span><strong> Dev</strong></a></div>
<div id="topmenu">
	<a href="c">C</a>
	<a href="cplusplus">C++</a>
	<a href="java">Java</a>
	<a href="javascript">JavaScript</a>
	<a href="node">Node</a>
	<a href="php">Php</a>
	<a href="web">Web</a>
	<a href="mobile">Mobile</a>
	<a href="poo">POO</a>
	<a href="uml">UML</a>
	<a href="patterns">Patterns</a>
	<a href="sgbd">SGBD</a>
	<a href="xml">XML</a>
</div>
<div id="user-actions">
   
		<a id="sign-in" href="#">Connexion</a>
		<span>|</span>
		<a id="register" href="#">Inscription</a>
	
	
</div>

<div class="login-form form">
    <form id="signIn-form"  action="signIn">
      <span>identifiant : </span><input  id="signIn-login" name="user.login" type="text" placeholder="identifiant"/>
      <span>mot de passe : </span><input id="signIn-password" name="user.password" type="password" placeholder="mot de passe"/>
      <img src="images/brain.png"/><a id="recover-password" href="#"> Mot de passe oublié?</a>
      <input type="submit" onclick="return signIn();" style="cursor:pointer" value="Connexion"/>
    </form>
 </div>
 <script>
  function signIn() {
	     var login = $('#signIn-login').val();
	     if(login.trim() == '') {
	    	 alert("Entrez votre identifiant");
	    	 $('#signIn-login').focus();
	    	 return false;
	     }
	     var password= $('#signIn-password').val();
	     if(password.trim() == '') {
	    	 alert("Entrez votre mot de passe");
	    	 $('#signIn-password').focus();
	    	 return false;
	     }
		 var formData = {
		        'user.login'  : login,
		         'user.password' : password
		  };
		 var url = $('#signIn-form').attr('action');
		  $(".wait").show();
		  $.ajax({
	          type        : 'POST',
	          url         : url,
	          data        : formData,
	          dataType    : 'json',
	          encode          : true
	      }).done(function(data) {
	    	  if(data.user) {
	    		$(".wait").hide();
	    		 window.location.reload(true);
	    	  } else {
	    		 $(".wait").hide();
	    	 	 alert("login ou mot de passe incorrect");
	    	 	 $(".login-form").fadeIn(1000);
	    	 	$('#signIn-login').focus();
	    	  }
          });
		  $(".login-form").fadeOut(100);
	  return false;
  }
 </script>
<div class="recover-password-form form">
    <form id="recover-form" action="recover">
     <span>identifiant :</span>
      <input id="recover-login" type="text" placeholder="identifiant"/>
      <img src="images/brain.png"/><small> Recevez un email. </small><input style="cursor:pointer" onclick="return recover();" type="submit" value="Récupérer"/>
    </form>
 </div> 
 
 <script>
  function recover() {
	  	  var login = $('#recover-login').val();
	      if(login.trim() == '') {
	    	 alert("Entrez votre identifiant");
	    	 $('#recover-login').focus();
	    	 return false;
	      }
	      var formData = {
		        'user.login'  : login
		  };
		 var url = $('#recover-form').attr('action');
		  $(".wait").show();
		  $.ajax({
	          type        : 'POST',
	          url         : url,
	          data        : formData,
	          dataType    : 'json',
	          encode          : true
	      }).done(function(data) {
	    	  if(data.user) {
	    		$(".wait").hide();
	    		 alert("un email vous a été envoyé");
	    	  } else {
	    		 $(".wait").hide();
	    	 	 alert("cet identifiant n'existe pas");
	    	 	 $(".recover-password-form").fadeIn(1000);
	    	 	$('#recover-login').focus();
	    	  }
          });
		  $(".recover-password-form").fadeOut(100);
	  return false;
  }
 </script>

 <div class="register-form form">
    <form id="register-form"  action="register">
    <span>type :</span><select id="register-type">
		  <option value="individuel">Individuel</option>
		  <option value="entreprise">Entreprise</option>
	  </select> 
     <span id="span-firstName">prénom : </span><input id="register-firstName" type="text" placeholder="prénom"/>
      <span id="span-lastName">nom : </span><input id="register-lastName" type="text" placeholder="nom"/>
      <span id="span-genre">genre :</span><select id="register-genre">
		  <option value="Masculin">Masculin</option>
		  <option value="Feminin">Féminin</option>
	  </select> 
      <span>email : </span><input id="register-email"  type="text" placeholder="email"/>
      <span>identifiant : </span><input id="register-login"  type="text" placeholder="identifiant"/>
      <span>mot de passe : </span><input id="register-password"  type="password" placeholder="mot de passe"/>
      <span>confirmer : </span><input id="register-confirm"  type="password" placeholder="confirmer"/>
      <span id="span-profil">profil :</span><select id="register-profil">
		  <option value="etudiant">Etudiant</option>
		  <option value="professionnel">Professionnel</option>
	  </select> 
	  <hr/>
	  <img src="images/brain.png"/><small> Créez votre compte. </small><input id="register-submit" onclick="return register();" style="cursor:pointer" type="submit" value="Je m'inscris"/>
    </form>
 </div>
 
  <script>
  function register() {
	    var type = $('#register-type').val();
	    var firstName = "";
	    if(type == "individuel") {
		     firstName = $('#register-firstName').val();
		     if(firstName.trim() == '') {
		    	 alert("Entrez votre prénom");
		    	 $('#register-firstName').focus();
		    	 return false;
		     }
	    }
	     var lastName = $('#register-lastName').val();
	     if(lastName.trim() == '') {
	    	 alert("Entrez votre nom");
	    	 $('#register-lastName').focus();
	    	 return false;
	     }
	     var genre = $('#register-genre').val();
	     var email = $('#register-email').val();
	     if(email.trim() == '') {
	    	 alert("Entrez votre email");
	    	 $('#register-email').focus();
	    	 return false;
	     }
	     var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	     if (!filter.test(email)) {
	       alert('votre email est invalide');
	       $('#register-email').focus();
	       return false;
	     }
	     var login = $('#register-login').val();
	     if(login.trim() == '') {
	    	 alert("Entrez votre login");
	    	 $('#register-login').focus();
	    	 return false;
	     }
	     var password = $('#register-password').val();
	     if(password.trim() == '') {
	    	 alert("Entrez votre mot de passe");
	    	 $('#register-password').focus();
	    	 return false;
	     }
	     var confirm = $('#register-confirm').val();
	     if(confirm.trim() == '') {
	    	 alert("Confirmez votre mot de passe");
	    	 $('#register-confirm').focus();
	    	 return false;
	     }
	     if(password != confirm) {
	  		alert("Les deux mots de passe ne sont pas identiques");
	  		return false;
	     }
	     var profil = $('#register-profil').val();
	     var formData = {
	    		'user.type':type,
	    		'user.firstName':firstName,
	    		'user.lastName':lastName,
	    		'user.genre':genre,
	    		'user.email':email,
		        'user.login':login,
		        'user.password':password,
		        'user.profil':profil
		  };
	      var url = $('#register-form').attr('action');
	      $(".wait").show();
		  $.ajax({
	          type        : 'POST',
	          url         : url,
	          data        : formData,
	          dataType    : 'json',
	          encode          : true
	      }).done(function(data) {
	    	  if(data.user) {
	    		  if(data.user.exist) {
	    			  $(".wait").hide();
	 	    	 	  alert("cet identifiant est deja pris");
	 	    	 	  $(".register-form").fadeIn(100);
	 	    	 	  $("#register-login").focus();
	    		  } else {
		    		$(".wait").hide();
		 	    	$(".login-form").slideDown(1000);
		 	    	$("#signIn-login").val(login);
		 	    	$("#signIn-password").val("").focus();
	    		  }
	    	  } else {
	    		 $(".wait").hide();
	    	 	 alert("erreur lors de la registration");
	    	 	$(".register-form").fadeIn(1000);
	    	  }
          });
		  $(".register-form").fadeOut(500);
	  return false;
  }
 </script>