<h1 class="icon-32 user-32">List Of Users <a id="new" href="#form"></a></h1>
<form id="search">
	<span>Filter :</span>
	<select name="filter">
	   <option>First Name</option>
	   <option>Last Name</option>
	   <option>Login</option>
       <option>Email</option>
       <option>Group</option>
       <option>Role</option>
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
       <th title="Login">Login</th>
       <th title="Email">Email</th>
       <th title="Group">Group</th>
        <th title="Role">Role</th>
       <th title="Created By">Created By</th>
    </tr>
 </thead>

<tbody>
   <script type="text/x-handlebars-template">
     {{#each this}}
      <tr id="{{id}}">
   	        <td class="user-16">{{firstName}}</td>
   	    	<td>{{lastName}}</td>
   	    	<td>{{login}}</td>
   	    	<td>{{email}}</td>
   	    	<td>{{group}}</td>
            <td>{{role}}</td>
   	    	<td>{{createdBy}}</td>
   	    </tr>
     {{/each}}
   </script>
   
 </tbody>
  
</table>

</div>

<div id="contextmenu">
    <a class="user-16 row-select">Select</a>
    <a class="edit-16">Edit</a>
    <a class="delete-16">Delete</a>
    <a class="print-16">Print</a>
    <a class="pdf-16">PDF</a>
</div>

<div id="selection">

  <span class="user-16">select a user</span>
  
</div>



<div id="details">
 <h2 class="user-16"></h2>

<ul class="tabs"> 
      <li class="active" rel="informations"><h2 title="Personal Informations">Personal Informations</h2></li>
      <li rel="contact"><h2 title="Contact">Contact</h2></li>
      <li rel="permissions"><h2 title="Permissions">Permissions</h2></li>
</ul>
<div class="tab_container"> 
   <div id="informations" class="tab_content">
     <script  type="text/x-handlebars-template">

       <fieldset>
		<span>First Name : </span>
		<span>{{firstName}}</span>
		
		<span>Last Name : </span>
		<span>{{lastName}}</span>
		
		<span>Login :</span>
		<span>{{login}}</span>
		
        <span>email :</span>
		<span>{{email}}</span>

        <span>group :</span>
		<span>{{group}}</span>

         <span>role :</span>
		<span>{{role}}</span>

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
   
   <div id="permissions" class="tab_content">
    <script  type="text/x-handlebars-template">
       <fieldset>
         <legend>Module Customers</legend>
        <span>Create : </span>
        <span>yes<input type="radio" name="customers.create" value="yes" checked/>
        no<input type="radio" name="customers.create" value="no"/>
       </span>
        <span>Read : </span>
        <span>yes<input type="radio" name="customers.read" value="yes" checked/>
        no<input type="radio" name="customers.read" value="no"/>
       </span>
       <span>Update : </span>
        <span>yes<input type="radio" name="customers.update" value="yes" checked/>
        no<input type="radio" name="customers.update" value="no"/>
       </span>
       <span>Delete : </span>
        <span>yes<input type="radio" name="customers.delete" value="yes" checked/>
        no<input type="radio" name="customers.delete" value="no"/>
       </span>
       <span>PDF : </span>
        <span>yes<input type="radio" name="customers.pdf" value="yes" checked/>
        no<input type="radio" name="customers.pdf" value="no"/>
       </span>
       <span>Print : </span>
        <span>yes<input type="radio" name="customers.print" value="yes" checked/>
        no<input type="radio" name="customers.print" value="no"/>
       </span>
       </fieldset>
       <fieldset>
         <legend>Module Products</legend>
          <span>Create : </span>
        <span>yes<input type="radio" name="products.create" value="yes" checked/>
        no<input type="radio" name="products.create" value="no"/>
       </span>
        <span>Read : </span>
        <span>yes<input type="radio" name="products.read" value="yes" checked/>
        no<input type="radio" name="products.read" value="no"/>
       </span>
       <span>Update : </span>
        <span>yes<input type="radio" name="products.update" value="yes" checked/>
        no<input type="radio" name="products.update" value="no"/>
       </span>
       <span>Delete : </span>
        <span>yes<input type="radio" name="products.delete" value="yes" checked/>
        no<input type="radio" name="products.delete" value="no"/>
       </span>
       <span>PDF : </span>
        <span>yes<input type="radio" name="products.pdf" value="yes" checked/>
        no<input type="radio" name="products.pdf" value="no"/>
       </span>
       <span>Print : </span>
        <span>yes<input type="radio" name="products.print" value="yes" checked/>
        no<input type="radio" name="products.print" value="no"/>
       </span>
       </fieldset>
       <fieldset>
         <legend>Module Orders</legend>
          <span>Create : </span>
        <span>yes<input type="radio" name="orders.create" value="yes" checked/>
        no<input type="radio" name="orders.create" value="no"/>
       </span>
        <span>Read : </span>
        <span>yes<input type="radio" name="orders.read" value="yes" checked/>
        no<input type="radio" name="orders.read" value="no"/>
       </span>
       <span>Update : </span>
        <span>yes<input type="radio" name="orders.update" value="yes" checked/>
        no<input type="radio" name="orders.update" value="no"/>
       </span>
       <span>Delete : </span>
        <span>yes<input type="radio" name="orders.delete" value="yes" checked/>
        no<input type="radio" name="orders.delete" value="no"/>
       </span>
       <span>PDF : </span>
        <span>yes<input type="radio" name="orders.pdf" value="yes" checked/>
        no<input type="radio" name="orders.pdf" value="no"/>
       </span>
       <span>Print : </span>
        <span>yes<input type="radio" name="orders.print" value="yes" checked/>
        no<input type="radio" name="orders.print" value="no"/>
       </span>
       </fieldset>
      <input type="submit" value="Change"/>
    </script>
   </div>
   
</div> 
 
 
</div>

 <form id="form" class="hide">
  
  <h1 class="user-32"></h1>  
   
    <div id="wizard">

      <div  title="User">	
          
           <fieldset class="info">
		<legend>User</legend>
		
		<span class="required">First Name : </span>
		<input title="First Name" name="firstName" type="text"/>
		
		<span class="required">Last Name : </span>
		<input title="Last Name" name="lastName" type="text"/>
		
		<span class="required">Login :</span>
		<input title="Login" name="login" type="text"/>
		
		<span class="required">Email :</span>
		<input title="Email" name="email" type="text"/>
		
		<span class="required">Group :</span>
		<input title="Group" name="group" type="text"/>
		
		<span class="required">Role :</span>
		<input title="Role" name="role" type="text"/>
		
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
		
		<input name="createdBy" type="hidden" value="admin"/>
	
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

<script type="text/javascript" src="modules/admin/js/users.js"></script>