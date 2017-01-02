<h1 class="icon-32">List Of Products <a id="new" href="#form">Create</a></h1>
<form id="search">
	<span>Filter :</span>
	<select name="filter">
	   <option>Name</option>
	   <option>Price</option>
	   <option>Created By</option>
	</select>
	<input name="value" type="text"  placeholder="Search..."/>
</form>
<div id="list">
<table>
 <thead>
    <tr>
       <th title="Name">Name</th>
       <th title="Price">Price</th>
       <th title="Created By">Created By</th>
    </tr>
 </thead>

<tbody>
   <template type="text/x-dust-template">
     {#.}
      <tr id="{id}">
   	        <td class="icon-16">{name}</td>
   	    	<td>{price}</td>
            <td>{createdBy}</td>
   	    </tr>
     {/.}
   </template>
   
 </tbody>
  
</table>

</div>

<div id="contextmenu">
    <a class="new-16">Create</a>
    <a class="icon-16 row-select">Read</a>
    <a class="edit-16">Update</a>
    <a class="delete-16">Delete</a>
    <a class="print-16">Print</a>
    <a class="pdf-16">PDF</a>
</div>

<div id="selection">

  <span class="icon-16">select a product</span>
  
</div>



<div id="details">
 <h2 class="icon-16"></h2>

<ul class="tabs"> 
      <li class="active" rel="informations-1"><h2 title="Info 1">Info 1</h2></li>
      <li rel="informations-2"><h2 title="Info 2">Info 2</h2></li>
</ul>
<div class="tab_container"> 
   <div id="informations-1" class="tab_content">
     <template  type="text/x-dust-template">

       <fieldset>
		<span>Name : </span>
		<span>{name}</span>
		
		<span>Price : </span>
		<span>{price}</span>
	
		
		</fieldset>
		

     </template>
     
   </div>
   <div id="informations-2" class="tab_content">
    <template  type="text/x-dust-template">
      <fieldset>
		
		</fieldset>
		

   </template>
   
   </div>
   
</div> 
 
 
</div>

 <form id="form" class="hide">
  
  <h1 class="icon-32"></h1>  
   
    <div id="wizard">
      
      <div title="Info 1">	
          
           <fieldset class="info">
		<legend>Info 1</legend>
		
		<label class="required">Name : </label>
		<input title="Name" name="name" type="text"/>
		
		<label class="required">Price : </label>
		<input title="Price" name="price" type="text"/>
		
	   <input name="createdBy" type="hidden" value="tetiana"/>
	
	</fieldset>
      </div>
      
       <div title="Info 2">	
          
           <fieldset class="info">
		<legend>Info 2</legend>
		
	    <label class="required">Field 1 : </label>
		<input title="Field 1" name="field1" type="text"/>
		
		<label class="required">Field 2 : </label>
		<input title="Field 2" name="field2" type="text"/>
	
	</fieldset>
      </div>
      
    </div>
     
</form>