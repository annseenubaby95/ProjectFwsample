<cfif isDefined("url.pid")>

    <cfoutput  query="#rc.getpro#">
        <cfset id="#pcode#">
        <cfset pro="#pro_name#">
        <cfset sub="#subcat_name#">
        <cfset subid="#subcode#">
        <cfset cat="#cat_name#">
        <cfset catid="#catcode#">
        <cfset price="#price#">
 		<cfset bid="#bcode#">
        <cfset brand="#brand_name#">
        <cfset des="#details#">
        <cfset button ="#rc.title#">
    </cfoutput>


<cfelse>
    <cfset id="0">
    <cfset pro="">
    <cfset sub="">
    <cfset subid="">
    <cfset cat="--select--">
    <cfset catid="">
	    <cfset brand="--select--">
    <cfset bid="">
    <cfset price="">
    <cfset quantity="">
    <cfset des="">
    <cfset button ="#rc.title#">

</cfif>

<div class="container my-4" style="justify-content: center;">
<div class="container col-8	 my-4 ">
	<h1 class="mb-3"><cfoutput>#rc.title#</cfoutput></h1>


       <div class="row">

          <div class="card-body">
            <form method="post" action="<cfoutput>#buildURL("main.addProduct_action")#</cfoutput>" >
            <input type="hidden" name="pid" value="<cfoutput>#id#</cfoutput>">
              <div class="form-group mb-3">
                <label for="exampleInputEmail1"> Product Name</label>
                <input type="text" name="productName" value="<cfoutput>#pro#</cfoutput>" class="form-control"  placeholder="Enter Product Name" required="">
              </div>
           		<div>
                <label for="exampleInputEmail1"> Category</label>
                <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="cats" id="cat">
                  <option value="<cfoutput>#catid#</cfoutput>" selected><cfoutput>#cat#</cfoutput></option>

			   		<cfoutput query="#rc.showcat#">
                      <option value=#catcode#>#cat_name#</option>
                  </cfoutput>
				 </select>

            	</div>




              <div>

                <label for="exampleInputEmail1"> SubCategory</label>
                <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="subs" id="sub">
                    <option value="" selected>--Select--</option>
                    <option value="<cfoutput>#subid#</cfoutput>" selected><cfoutput>#sub#</cfoutput></option>
                  </select>

              </div>
			<div>

                <label for="exampleInputEmail1"> Brand</label>
                <select class="form-select form-select-lg mb-3" aria-label="Default select example" name="brand" id="brand">
                  <option value="<cfoutput>#bid#</cfoutput>" selected><cfoutput>#brand#</cfoutput></option>
                  <cfoutput query="#rc.brand#">
                      <option value=#bcode#>#brand_name#</option>
                  </cfoutput>

            </div><br>




              <div>
              <label for="exampleInputEmail1"> Price</label>
               <input type="text" name="prices" class="form-control" value="<cfoutput>#price#</cfoutput>" placeholder="Enter Price" required="">
              </div><br>
              <div class="input-group" >
                <span class="input-group-text">Description</span>
                <textarea class="form-control" aria-label="With textarea" name="Description" value=""><cfoutput>#des#</cfoutput></textarea>
              </div><br>
              <button type="submit" class="btn btn-primary" name ="<cfoutput>#button#</cfoutput>"><cfoutput>#button#</cfoutput></button>
            </form>
          </div>
        </div>
      </div>
   </div>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800"><cfoutput></cfoutput></h1>
      <cfparam name="rc.message" default="#arrayNew(1)#">
      <cfif not arrayIsEmpty(rc.message)>

        <cfloop array="#rc.message#" index="msg">
          <center><h5 style="color: green"><cfoutput>#msg#</cfoutput></h5></center>
        </cfloop>
      </cfif>
 </div>
<cfif rc.title!='Edit Product'>


<div class="container my-4">
 <div class="card-body">
  <div class="table-responsive">
              <table class="table table-bordered align-items-center table-flush" id="dataTable">
                <thead class=" text-primary">
                  <th>Pcode</th>
                  <th>Category  Name</th>
 					<th>Sub Category  Name</th>
					<th>Brand</th>

					<th>Product Name</th>
					<th>Price</th>

                </thead>

              <tbody>
                  <cfoutput query="#rc.pro#">
                       <!--- <cfscript>
                          key = generateSecretKey('AES');
                          encryptedMsg = encrypt(#ID#,key,'AES', 'Base64');
                      </cfscript> --->
                      <tr>

                      <td>#pcode#</td>
                      <td>#cat_name#</td>
  					  <td>#subcat_name#</td>
						<td>#brand_name#</td>
  					  <td>#pro_name#</td>
					<td>#price#</td>
 					  <td><a href="#buildURL(action="main.add_product",querystring="pid=#pcode#")#" class="btn btn-primary btn-sm">Edit</a></td>

					 </tr>
                      </cfoutput>



          </tbody>
      </table>
    </div>
  </div>
</div>


 </cfif>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script>
	$('#cat').change(function() {

    var value = $('#cat').val();

<!---
alert(value);
 --->

  $.ajax({
        type: "get",
        url:"index.cfm?action=main.getsubcat",
        data:{"ID":value},
        success: function(sub){
               $("#sub").html(sub)
           }
    });

});
</script>
