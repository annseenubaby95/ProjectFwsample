

<div class="container"style="padding:150px 50px 150px 50px">

  <cfparam name="rc.message" default="#arrayNew(1)#">
  <cfif not arrayIsEmpty(rc.message)>
    <cfloop array="#rc.message#" index="msg">
      <p style="margin-top:80px;  "><cfoutput>#msg#</cfoutput></p>
    </cfloop>
  </cfif>

  <div class="row">
<h1 >PRODUCTS</h1>
      <cfoutput query="#rc.show#">

      <div class=col-4>


              <div class="card#pcode#" style="margin-bottom:5px;border:1px solid black; background-color:DarkSalmon;">

                  <div class="card-body">
                    <h5 class="card-title">#pro_name#</h5>
                    <p class="card-text">#details#</p>
                  </div>
                  <ul class="list-group list-group-flush">
                    <li class="list-group-item">#subcat_name#</li>
                    <li class="list-group-item">#cat_name#</li>

                    <li class="list-group-item"><strong>Rs:#Price#</strong></li>
                  </ul>
                  <div class="card-body">
                      <a href="#buildURL(action='cart.addCart',queryString="pcode=#pcode#")#" class="btn btn-success bt#pcode#" onclick="msg()">Add To Cart</a>
                      <!--- <span class="1#ID# hide1"  >
                          Quantity:<input   id="inputsm" type="text"style="width:60px"><br><br>
                          <a class="btn btn-primary" onclick="orders(#ID#)" >Buy</a><br><br>
                      </span> --->


                      <a href="#buildURL(action='order.orderitem',queryString="pcode=#pcode#")#" class="btn btn-primary"  >Buy</a>
                  </div>

              </div>





      </div>
  </cfoutput>
  </div>


</div>


</div>

<a href="<cfoutput>#buildURL(action='main.search')#</cfoutput>">Goto Home Page</a>
<script>
  function msg(){
    alert("Succrssfully Added To Cart")
  }
</script>