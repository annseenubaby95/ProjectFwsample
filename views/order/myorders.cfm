

            <section class="section-3" id="pricing" style="margin-top:100px">
              <div class="container">
                 <div class="row">

                   <h1 class="text-center">MY ORDERS</h1>

                  <!---
 <p class="text-center"><a href="<cfoutput>#buildURL("cart.checkout")#</cfoutput>" class="btn btn-danger btn-sm txt-right">Buy All</a></p>
 --->

             <table class="table table-dark table-striped" id="example1">
             <thead>
              <tr>
                <td>Order No</td>
                <td>Product</td>
                <td>Unit Price</td>
                <td>Quantity</td>
                <td>Total</td>
				 <td>Purchase Date</td>

              </tr>
             </thead>
             <tbody>
             <cfoutput query="#rc.show#">
              <!--- <cfset tot="#GetCarts.Quantity * GetCarts.Price#"> --->
              <tr>
                <td>#order_id#</td>
                <td>#pro_name#</td>
				 <td>#qty#</td>
				  <td>#price#</td>
				   <td>#total_price#</td>
                <td>#order_date#</td>

              </tr>
             </cfoutput>

             </tbody>
             </table>

             </div>
               </div>
             </section>
