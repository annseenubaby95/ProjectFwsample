

<div class="container my-4" style="justify-content: center;">
<div class="container col-8	 my-4 ">
	<h1 class="mb-3"><cfoutput>#rc.title#</cfoutput></h1>

<form method="post" action="<cfoutput>#buildURL(action="main.add_subcategory_action")#</cfoutput>">
	 <input type="hidden" name="sid" class="form-control" value="<cfoutput>#rc.sid#</cfoutput>" >


   <select class="form-select form-select mb-3" aria-label=".form-select-lg example" name="catcode" id="c" required>
  	<option value="<cfoutput>#rc.catcode#</cfoutput>"><cfoutput>#rc.cname#</cfoutput></option>

	  <cfoutput query="#rc.cate#">
		<cfif rc.catcode!='#catcode#'>
  		<option value='#catcode#'>#cat_name#</option>
	 	</cfif>
   	  </cfoutput>

	</select>

  <input type="text" name="scat_name" class="form-control mb-3" value="<cfoutput>#rc.scat#</cfoutput>" placeholder="Enter Sub Category Name" required="">


 <button type="submit" class="btn btn-primary mb-6 form-control"><cfoutput>#rc.button#</cfoutput></button>

</form>
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
<cfif rc.title!='Edit Sub Category'>


<div class="container my-4">
 <div class="card-body">
  <div class="table-responsive">
              <table class="table table-bordered align-items-center table-flush" id="dataTable">
                <thead class=" text-primary">
                  <th>Sub Code</th>
                  <th>Category  Name</th>
 				<th>Sub Category  Name</th>
                </thead>

              <tbody>
                  <cfoutput query="#rc.show#">
                       <!--- <cfscript>
                          key = generateSecretKey('AES');
                          encryptedMsg = encrypt(#ID#,key,'AES', 'Base64');
                      </cfscript> --->
                      <tr>

                      <td>#subcode#</td>
                      <td>#cat_name#</td>
  					  <td>#subcat_name#</td>

 					  <td><a href="#buildURL(action="main.add_subcategory",querystring="sid=#subcode#")#" class="btn btn-primary btn-sm">Edit</a></td>
 					  <td><a href="#buildURL(action="main.delete_subcategory",querystring="sid=#subcode#")#" class="btn btn-danger btn-sm">Delete</a></td>
                      </tr>
                      </cfoutput>



          </tbody>
      </table>
    </div>
  </div>
</div>


 </cfif>