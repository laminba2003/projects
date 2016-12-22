<h1 class="icon-32">List Of Orders <a id="new" href="#form">Create</a></h1>
<form id="search">
	<span>Filter :</span>
	<select name="filter">
	   <option>Product</option>
	   <option>Customer</option>
	   <option>Created By</option>
	</select>
	<input name="value" type="text"  placeholder="Search..."/>
</form>
<div id="list">
<table>
 <thead>
    <tr>
       <th title="Product">Product</th>
       <th title="Price">Price</th>
       <th title="Quantity">Quantity</th>
       <th title="Amount">Amount</th>
       <th title="Customer">Customer</th>
       <th title="Created By">Created By</th>
    </tr>
 </thead>

<tbody>
   <script type="text/x-dust-template">
     {#.}
      <tr id="{id}">
   	        <td class="icon-16">{product}</td>
            <td>{price}</td>
   	    	<td>{quantity}</td>
            <td>{amount}</td>
            <td>{customer}</td>
            <td>{createdBy}</td>
   	    </tr>
     {/.}
   </script>
   
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

  <span class="icon-16">select an order</span>
  
</div>



<div id="details">
 <h2 class="icon-16"></h2>

<ul class="tabs"> 
      <li class="active" rel="informations-1"><h2 title="Info 1">Info 1</h2></li>
      <li rel="informations-2"><h2 title="Info 2">Info 2</h2></li>
</ul>
<div class="tab_container"> 
   <div id="informations-1" class="tab_content">
     <script  type="text/x-dust-template">

       <fieldset>
		<span>Product : </span>
		<span>{product}</span>
		
		<span>Price : </span>
		<span>{price}</span>
	
       <span>Quantity : </span>
		<span>{quantity}</span>
       
      <span>Amount : </span>
	  <span>{amount}</span>
	
      <span>Customer : </span>
	  <span>{customer}</span>
		
      	
		</fieldset>
		

     </script>
     
   </div>
   <div id="informations-2" class="tab_content">
    <script  type="text/x-dust-template">
      <fieldset>
		
		</fieldset>
		

   </script>
   
   </div>
   
</div> 
 
 
</div>

 <form id="form" class="hide">
  
  <h1 class="icon-32"></h1>  
   
    <div id="wizard">
      
      <div  title="Info 1">	
          
           <fieldset class="info">
		<legend>Info 1</legend>
		
		<label class="required">Product : </label>
		<input  title="Product" name="product" type="text"/>
		
		<label class="required">Quantity : </label>
		<input title="Quantity" name="quantity" type="text"/>
		
		<label class="required">Customer : </label>
		<input title="Customer" name="customer" type="text"/>
		
		
	   <input name="createdBy" type="hidden" value="tetiana"/>
	
	</fieldset>
      </div>
      
       <div title="Info 2">	
          
           <fieldset class="info">
		<legend>Info 2</legend>
		
		  <label class="required">Field 1 : </label>
		<input title="" name="field1" type="text"/>
		
		  <label class="required">Field 2 : </label>
		<input title="" name="field2" type="text"/>
	
	</fieldset>
      </div>
      
    </div>
     
</form>