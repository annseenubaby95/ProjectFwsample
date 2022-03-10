

<div class="container my-4 align-items-center">
<h1>EDIT CATEGORY</h1>
 <div class="d-sm-flex align-items-center justify-content-between mb-4">
      <h1 class="h3 mb-0 text-gray-800"><cfoutput></cfoutput></h1>
      <cfparam name="rc.message" default="#arrayNew(1)#">
      <cfif not arrayIsEmpty(rc.message)>

        <cfloop array="#rc.message#" index="msg">
          <center><h5 style="color: green"><cfoutput>#msg#</cfoutput></h5></center>
        </cfloop>
      </cfif>
    </div>
	<cfdump var="#rc.show#" >
<form method="post" action="<cfoutput>#buildURL(action="main.add_category")#</cfoutput>">
	  <cfoutput query="#rc.show#">
	 <input type="hidden" name="catcode" class="form-control" value="#rc.catcode#" >
<div class="mb-4 row ">
	<div class="col-sm-3">
    <label for="category">Category Name</label>
	</div>
    <div class="col-sm-6">
     <input type="text" name="cat_name" class="form-control" value="#rc.cat_name#" placeholder="Enter Category Name" required="">
    </div>
 </div>

<div class="mb-3 row col-sm-6">
    <button type="submit" class="btn btn-primary mb-6">Submit</button>
  </div>
    </cfoutput>
</form>

</div>

