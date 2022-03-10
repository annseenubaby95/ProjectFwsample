


<div class="container col-5  my-4 justify-content-center">
<cfparam name="rc.message" default="#arrayNew(1)#">
            <cfif not arrayIsEmpty(rc.message)>
              <cfloop array="#rc.message#" index="msg">
                <center><h5 style="color: red"><cfoutput>#msg#</cfoutput></h5></center>
              </cfloop>
            </cfif>
<cfoutput >
	<form action="#buildURL(action='login.userlogin')#" method="post">
		<h1 align="center">Login </h1>
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Username</label>
    <div class="col-sm-10">
      <input type="Email" name="uname" class="form-control" id="a1" >
    </div>
  </div>
  <div class="mb-3 row">
    <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
      <input type="password" name="password" class="form-control" id="a2" >
    </div>
  </div>
  <div class="mb-3 row">
    <button type="submit" class="btn btn-primary mb-6">Login</button>
  </div>
</form>

</div>

<!---
<p><a href="#buildURL('main.default')#">Main</a>!</p>
 <p><a href="#buildURL('main.others')#">Other</a>!</p> --->
</cfoutput>