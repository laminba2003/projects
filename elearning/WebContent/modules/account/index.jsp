<%@ taglib prefix="s" uri="/struts-tags"%>
<h1>Information</h1>
<div class="account">

 <div class="message-info">
    <img src="images/user_64.png"/>
     <div id="title">
      <span class="property"><b>Identifiant : </b></span>
		<span><s:property value="user.login"/> </span><br/>
      <span class="property"><b>Profil : </b></span>
		<span><s:property value="user.profil"/> </span>
		<br/>
		<span class="property"><b>Créé le : </b></span>
		<span class="date"><s:date name="user.creationDate" format="dd/MM/yyyy" /> </span>
		<span class="property"><b>Heure : </b></span>
		<span class="date"><s:date name="user.creationDate" format="hh:mm" /> </span>
		
	 </div>
 </div>
 <h2 class="title">Informations Personnelles</h2>
 <div class="message-info message-info-even">
    <img src="images/info_64.png"/>
     <div id="title">
		<span class="property"><b>Email : </b></span>
		<span><s:property value="user.email"/> </span><br/>
		<span class="property"><b>Prénom : </b></span>
		<span><s:property value="user.firstName"/> </span>
		<br/>
        <span class="property"><b>Nom : </b></span>
		<span><s:property value="user.lastName"/> </span>
		<br/>
		 <span class="property"><b>Genre : </b></span>
		<span><s:property value="user.genre"/> </span>
	 </div>
 </div>
 
 <h2 class="title">Modifier votre mot de passe</h2>
 <div class="message-info message-info-even">
    <img src="images/security_64.png"/>
     <div id="title">
		<span class="property"><b>Ancien : </b></span>
		<span class="date"><input type="password"/> </span>
		<span><input type="submit" value="Modifier"/></span><br/>
		<span class="property"><b>Nouveau : </b></span>
		<span><input type="password"/> </span><br/>
		<span class="property"><b>Confirmer : </b></span>
		<span><input type="password"/> </span>
		
	 </div>
 </div>

</div>