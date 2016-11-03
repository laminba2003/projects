<h1 class="icon-32 group-32">List Of Groups <a id="new" href="#form"></a></h1>
<form id="search">
	<span>Filter :</span>
	<select name="filter">
	   <option>Name</option>
	</select>
	<input name="value" type="text"  placeholder="Search..."/>
</form>

<div id="list">
<table>
 <thead>
    <tr>
       <th title="Name">Name</th>
       <th title="Created By">Created By</th>
    </tr>
 </thead>

<tbody>
   <script type="text/x-handlebars-template">
     {{#each this}}
      <tr id="{{id}}">
   	        <td class="group-16">{{name}}</td>
   	    	<td>{{createdBy}}</td>
   	    </tr>
     {{/each}}
   </script>
   
 </tbody>
  
</table>

</div>

<div id="contextmenu">
    <a class="group-16 row-select">Select</a>
    <a class="edit-16">Edit</a>
    <a class="delete-16">Delete</a>
    <a class="print-16">Print</a>
    <a class="pdf-16">PDF</a>
</div>

<div id="selection">

  <span class="user-16">select a group</span>
  
</div>



<div id="details">
 <h2 class="group-16"></h2>

<ul class="tabs"> 
      <li class="active" rel="informations"><h2 title="Informations">Informations</h2></li>
      <li rel="permissions"><h2 title="Permissions">Permissions</h2></li>
</ul>
<div class="tab_container"> 
   <div id="informations" class="tab_content">
     <script  type="text/x-handlebars-template">

       <fieldset>
		<span>Name : </span>
		<span>{{name}}</span>
		
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
  
  <h1 class="group-32"></h1>  
   
    <div id="wizard">

      <div  title="Group">	
          
           <fieldset class="info">
		<legend>Group</legend>
	   
	   <span class="required">Name : </span>
		<input title="Name" name="name" type="text"/>
		<input name="createdBy" type="hidden" value="admin"/>
	
	</fieldset>
      </div>
      
       <div title="Permissions">	
          
           <fieldset class="info">
		<legend>Permissions</legend>
		
	
	</fieldset>
      </div>
   
      
    </div>
     
</form>

<script type="text/javascript" src="modules/admin/js/groups.js"></script>