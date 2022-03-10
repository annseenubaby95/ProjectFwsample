

<div class="container my-4" style="justify-content: center;">

<h1 class="mb-3"><cfoutput>#rc.title#</cfoutput></h1>

<form method="post" action="<cfoutput>#buildURL(action="main.add_brand_action")#</cfoutput>">
	 <input type="hidden" name="bcode" class="form-control" value="<cfoutput>#rc.bid#</cfoutput>" >

	<div class="col-sm-6 mb-4">
    <label for="category">Brand Name</label>
	</div>
    <div class="col-sm-6 mb-4">
     <input type="text" name="bname" class="form-control" value="<cfoutput>#rc.bname#</cfoutput>" placeholder="Enter Brand Name" required="">
    </div>
	 <div class="col-sm-6 mb-4">
     <button type="submit" class="btn btn-primary mb-6 form-control"><cfoutput>#rc.button#</cfoutput></button>
    </div>


</form>

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
<cfif rc.title!='Edit Brand'>


<div class="container my-4">
 <div class="card-body">
  <div class="table-responsive">
              <table class="table table-bordered align-items-center table-flush" id="dataTable">
                <thead class=" text-primary">
                  <th>Brand Code</th>
                  <th>Brand  Name</th>

                </thead>

              <tbody>
                  <cfoutput query="#rc.show#">
                       <!--- <cfscript>
                          key = generateSecretKey('AES');
                          encryptedMsg = encrypt(#ID#,key,'AES', 'Base64');
                      </cfscript> --->
                      <tr>

                      <td>#bcode#</td>
                      <td>#brand_name#</td>


 					  <td><a href="#buildURL(action="main.add_brand",querystring="bid=#bcode#")#" class="btn btn-primary btn-sm">Edit</a></td>
 					  <td><a href="#buildURL(action="main.delete_brand",querystring="bid=#bcode#")#" class="btn btn-danger btn-sm">Delete</a></td>
                      </tr>
                      </cfoutput>



          </tbody>
      </table>
    </div>
  </div>
</div>


 </cfif>