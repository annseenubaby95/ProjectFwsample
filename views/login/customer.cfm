
<cfoutput >
<center><h1 class="text-center text-success"style="margin-top:50px">Registration</h1></center>
<div class="container"style="margin-top:70px">
    <form class="" method="post" action=<cfoutput>"#BuildURL(action='login.savecust' )#"</cfoutput>>
        <div class="form-group">


            <input type="hidden" name="id" value="0">
          <label for="formGroupExampleInput">Full Name</label>
          <input type="text" class="form-control" name='fullname' id="formGroupExampleInput" value="" placeholder="Your Full Name">
        </div>
        <div class="form-group">
          <label for="formGroupExampleInput2">Email</label>
          <input type="Email" class="form-control" id="formGroupExampleInput2" name='email' value="" placeholder="Enter your Email">
        </div>
        <div class="form-group">
          <label for="formGroupExampleInput2">Phone Number</label>
          <input type="text" class="form-control" id="formGroupExampleInput2" name="phonenumber" value="" placeholder="Enter your Phone number">
        </div>
        <div class="form-group">
          <label for="formGroupExampleInput2">Address</label>
          <textarea class="form-control" id="formGroupExampleInput2" name="address" value="" placeholder="Enter Address"></textarea>
        </div>
        <div class="form-group">
            <label for="formGroupExampleInput2">Password</label>
            <input type="password" class="form-control" id="formGroupExampleInput2" name="password" value="" placeholder="Enter a password">
          </div>
          <br>
        <center><button class="btn btn-primary"type="submit">Register</button></center>
      </form>
</div>
</cfoutput >