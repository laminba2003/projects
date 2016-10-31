<h1 class="icon-32">List Of Customers <a id="new" href="#form"></a></h1>
<form id="search">
	<span>Filter :</span>
	<select name="filter">
	   <option>First Name</option>
	   <option>Last Name</option>
       <option>Date Of Birth</option>
       <option>Country</option>
       <option>Created By</option>
	</select>
	<input name="value" type="text"  placeholder="Search..."/>
</form>

<div id="list">
<table>
 <thead>
    <tr>
       <th title="First Name">First Name</th>
       <th title="Last Name">Last Name</th>
       <th title="Profession">Profession</th>
       <th title="Date Of Birth">Date Of Birth</th>
       <th title="Country">Country</th>
       <th title="Created By">Created By</th>
    </tr>
 </thead>

<tbody>
   <script type="text/x-handlebars-template">
     {{#each this}}
      <tr id="{{id}}">
   	        <td class="icon-16">{{firstName}}</td>
   	    	<td>{{lastName}}</td>
   	    	<td>{{profession}}</td>
   	    	<td>{{dateOfBirth}}</td>
   	    	<td>{{country}}</td>
   	    	<td>{{createdBy}}</td>
   	    </tr>
     {{/each}}
   </script>
   
 </tbody>
  
</table>

</div>

<div id="contextmenu">
    <a class="icon-16 row-select">Select</a>
    <a class="edit-16">Edit</a>
    <a class="delete-16">Delete</a>
    <a class="print-16">Print</a>
    <a class="pdf-16">PDF</a>
</div>

<div id="selection">

  <span class="icon-16">select a customer</span>
  
</div>



<div id="details">
 <h2 class="icon-16"></h2>

<ul class="tabs"> 
      <li class="active" rel="informations"><h2 title="Personal Informations">Personal Informations</h2></li>
      <li rel="contact"><h2 title="Contact">Contact</h2></li>
</ul>
<div class="tab_container"> 
   <div id="informations" class="tab_content">
     <script  type="text/x-handlebars-template">

       <fieldset>
		<span>First Name : </span>
		<span>{{firstName}}</span>
		
		<span>Last Name : </span>
		<span>{{lastName}}</span>
		
		<span>Profession :</span>
		<span>{{profession}}</span>
		
		<span>Date Of Birth :</span>
		<span>{{dateOfBirth}}</span>
		
		<span>Country :</span>
		<span>{{country}}</span>
		
		<span>Sex :</span>
		<span>{{sex}}</span>
		
		</fieldset>
		
		<fieldset>
		
		<span>Telephone :</span>
		<span>{{telephone}}</span>
		
		<span>Mobile :</span>
		<span>{{mobile}}</span>
	   
	    <span>Email :</span>
		<span>{{email}}</span>
	
	  </fieldset>

     </script>
     
   </div>
   <div id="contact" class="tab_content">
    <script  type="text/x-handlebars-template">
      <fieldset>
		<span>First Name : </span>
		<span>{{contact.firstName}}</span>
		
		<span>Last Name : </span>
		<span>{{contact.lastName}}</span>
		
		<span>Profession :</span>
		<span>{{contact.profession}}</span>
		
		<span>Date Of Birth :</span>
		<span>{{contact.dateOfBirth}}</span>
		
		<span>Country :</span>
		<span>{{contact.country}}</span>
		
		<span>Sex :</span>
		<span>{{contact.sex}}</span>
		
		<span>Relation :</span>
		<span>{{contact.relation}}</span>
		
		</fieldset>
		
		<fieldset>
		
		<span>Telephone :</span>
		<span>{{contact.telephone}}</span>
		
		<span>Mobile :</span>
		<span>{{contact.mobile}}</span>
	   
	    <span>Email :</span>
		<span>{{contact.email}}</span>
	
	  </fieldset>

   </script>
   
   </div>
   
</div> 
 
 
</div>

 <form id="form" class="hide">
  
  <h1 class="icon-32"></h1>  
   
    <div id="wizard">
    
      <div title="Customer">	
          
           <fieldset class="info">
		<legend>Customer</legend>
		
		<span class="required">First Name : </span>
		<input  title="First Name" name="firstName" type="text"/>
		
		<span class="required">Last Name : </span>
		<input title="Last Name" name="lastName" type="text"/>
		
		<span class="required">Profession :</span>
		<input title="Profession" name="profession" type="text"/>
		
		<span>Date Of Birth :</span>
		<input title="Date Of Birth" name="dateOfBirth" type="text"/>
		
		<span class="required">Sex :</span>
		<select title="Sex" name="sex">
			 <option>Male</option>
		 	<option>Female</option>
		</select>
		
		<span class="required">Country :</span>
		<select title="Country" name="country">
			 <option>USA</option>
		</select>
		
		<span>Telephone :</span>
		<input title="Telephone" name="telephone" type="text"/>
		
		<span class="required">Mobile :</span>
		<input title="Mobile" name="mobile" type="text"/>
	   
	    <span>Email :</span>
		<input title="Email" name="email" type="text"/>
		
		<input name="createdBy" type="hidden" value="tetiana"/>
	
	</fieldset>
      </div>
      
       <div title="Contact">	
          
           <fieldset class="info">
		<legend>Contact</legend>
		
		<span class="required">First Name : </span>
		<input title="First Name" name="contact.firstName" type="text"/>
		
		<span class="required">Last Name : </span>
		<input title="Last Name" name="contact.lastName" type="text"/>
		
		<span class="required">Profession :</span>
		<input title="Profession" name="contact.profession" type="text"/>
		
		<span>Date Of Birth :</span>
		<input title="Date Of Birth" name="contact.dateOfBirth" type="text"/>
		
		<span class="required">Sex :</span>
		<select title="Sex" name="contact.sex">
			 <option>Male</option>
		 	<option selected="selected">Female</option>
		</select>
		
		<span class="required">Country :</span>
		<select title="Country" name="country">
			 <option>USA</option>
		</select>
		
		<span class="required">Relation :</span>
		<select title="Relation"  name="contact.relation">
		     <option>Wife</option>
			 <option>Husband</option>
			 <option>Parent</option>
			 <option>Friend</option>
			 <option>Other</option>
		</select>
		
		<span>Telephone :</span>
		<input title="Telephone" name="contact.telephone" type="text"/>
		
		<span class="required">Mobile :</span>
		<input title="Mobile" name="contact.mobile" type="text"/>
	   
	    <span>Email :</span>
		<input title="Email" name="contact.email" type="text"/>
	
	</fieldset>
      </div>
      
    </div>
     
</form>