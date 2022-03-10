<div class="content">
    <div class="container-fluid my-4">

          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered align-items-center table-flush" id="dataTable">
                <thead class=" text-primary">
                  <th>ID</th>
                  <th>Customer  Name</th>
                  <th>Email</th>
                  <th>Phone Number</th>
                  <th>Address</th>

                </thead>

              <tbody>
                  <cfoutput query="#rc.show#">
                       <!--- <cfscript>
                          key = generateSecretKey('AES');
                          encryptedMsg = encrypt(#ID#,key,'AES', 'Base64');
                      </cfscript> --->
                      <tr>

                      <td>#regid#</td>
                      <td>#name#</td>
                      <td>#email#</td>
                      <td>#phno#</td>
                      <td>#address#</td>

  <!---  <td><a href="#buildURL(action="main.add_category")#" class="btn btn-primary btn-sm">Edit</a></td> --->
                      </tr>
                      </cfoutput>



          </tbody>
      </table>
    </div>
  </div>
</div>
</div>
</div>
</div>
</div>