

            <section class="section-3" id="pricing" style="margin-top:100px">
              <div class="container">
                 <div class="row">

                   <h1 class="text-center">MY CART</h1>

                  <!---
 <p class="text-center"><a href="<cfoutput>#buildURL("cart.checkout")#</cfoutput>" class="btn btn-danger btn-sm txt-right">Buy All</a></p>
 --->

             <table class="table table-dark table-striped" id="example1">
             <thead>
              <tr>
                <td>Sl No</td>
                <td>Product</td>
                <td>Price</td>
                <td>Quantity</td>
                <td>Total</td>
                <td>Action</td>
              </tr>
             </thead>
             <tbody>
             <cfoutput query="#rc.show#">
              <!--- <cfset tot="#GetCarts.Quantity * GetCarts.Price#"> --->
              <tr>
                <td>#cartid#</td>
                <td>#pro_name#</td>
                <td>#total#</td>
                <td><input type="number" class="quantity" value="#Quantity#" id="quantity#cartid#" onchange="change_qty(this.value,#pcode#,#cartid#)" min=1 max=10 ></td>
                <td><span id="tot#cartid#">#total#</span></td>

                <td><button class="btn btn-primary btn-sm buy" id="buybtn" data-id="#cartid#" id="buybtn"  >Buy Now</button>&nbsp;&nbsp;
				    <button class="btn btn-danger btn-sm buy" data-id="#cartid#" id="delbtn"  >Remove</button>

              </tr>
             </cfoutput>

             </tbody>
             </table>

             </div>
               </div>
             </section>
             <script>
               function change_qty(val,pid,id){

                if (val < 1) {
                  $("#quantity"+id).val(1)
                  val=1

                }
                if(val > 10){
                  $("#quantity"+id).val(10)
                  val=10


                }

                $.ajax({
                  type: "POST",
                  url:"mycart.cfm?action=cart.updatecart",
                  data:{"qty":val,"pcode":pid,"cid":id},
                  success:function(ajaxdata){
                    $("#tot"+id).html(ajaxdata)
                  }
                })

               }


		document.getElementById("buybtn").onclick = function() {
				  var el = this;
                  var id=$(this).data('id');
                  $.ajax({
                  type: "POST",
                  url:"mycart.cfm?action=order.buyproductcart",
                  data:{"cid":id},
                 success: function(){

                              $(el).closest('tr').css('background','tomato');
                              $(el).closest('tr').fadeOut(800,function(){
                              $(this).remove();
                              alert("Item Purchased Successfully")
                              });

                          }
                })};


document.getElementById("delbtn").onclick = function() {
                  var el = this;
                  var id=$(this).data('id');
                  $.ajax({
                  type: "POST",
                  url:"mycart.cfm?action=cart.itemRemovecart",
                  data:{"cid":id},
                  success: function(){

                              $(el).closest('tr').css('background','tomato');
                              $(el).closest('tr').fadeOut(800,function(){
                              $(this).remove();
                              $("#del").fadeIn()
                              $("#del").fadeOut(3000)
                              });

                          }
                })
                 }



             </script>

<script>

function myFunction() {
  document.getElementById("demo").innerHTML = "YOU CLICKED ME!";
}
</script>
