





  <div class="row justify-content-center">
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


                  </ul>
                  <div class="card-body">
					<FORM METHOD="POST" ACTION="<cfoutput>#buildURL(action='order.buyproduct')#</cfoutput>">
			<input type="hidden" name="pcode" value="#pcode#">
       		<strong>Rs :     <input type="text" name="price" class="no-border" size="10"  value="#price#" id="price"  readonly></strong><br>
             <strong>Quantity<input type="number"  value="1" size="3" name="qty" id="qty" onchange="change_qty(this.value)" min=1 max=10 ></strong><br>

              <strong>Total   :<span id="tot">#price#</span></strong><br>


                      <button  class="btn btn-primary">Buy</button>
                  </FORM>
					</div>

              </div>





      </div>
  </cfoutput>
  </div>


</div>


</div>

             <script>
               function change_qty(val){

               	if (val < 1) {
                  $("qty").val(1)
                  val=1

                }
                if(val > 10){
                  $("qty"+id).val(10)
                  val=10


                }

var p=document.getElementById("price").value;
var tot=p*val;
document.getElementById("tot").innerHTML=tot;






               }




             </script>

<script>

function myFunction() {
  document.getElementById("demo").innerHTML = "YOU CLICKED ME!";
}
</script>
