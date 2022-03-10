

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
	<div class="container   col-8 my-4">
	<h1>New form </h1>
<cfoutput >
	<form action="#buildURL(action='main.sum')#" method="post">
<div class="mb-3 row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Value 1</label> #rc.a1#
    <div class="col-sm-10">
      <input type="text" name="a1" class="form-control" id="a1" >
    </div>
  </div>
  <div class="mb-3 row">
    <label for="inputPassword" class="col-sm-2 col-form-label">value 2</label>#rc.a2#
    <div class="col-sm-10">
      <input type="text" name="a2" class="form-control" id="a2" >
    </div>
  </div>
  <div class="mb-3 row">
    <button type="submit" class="btn btn-primary mb-6">Submit</button>
  </div>
</form>
</cfoutput>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>


<cfoutput>
  <p>Goodbye FW/1</p>
  <p><a href="#buildURL('main')#">Register</a>!</p>
</cfoutput>