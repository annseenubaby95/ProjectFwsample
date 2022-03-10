/**
 * order
 *
 * @author loremine
 * @date 9/3/22
 **/
component accessors=true output=false persistent=false {

property orderServices;
property mainServices;
function init( fw ) {
    variables.fw = fw;
    return this;
}


function default(rc){
        variables.fw.redirect("login.login_page");
    }
/*public query function buyorder(rc){

        rc.ajaxdata=variables.orderServices.Buy(rc.cid)

        return rc.ajaxdata
    }*/

  public any  function buyproduct(rc){

       rc.query=variables.orderServices.OrderItem(rc.pcode,rc.qty,rc.price);
		variables.fw.redirect("order.myorders");
    }

   public any  function orderitem(rc){

       rc.show=variables.mainServices.getproduct(rc.pcode);

    }
  public any  function buyproductcart(rc){

       rc.ajaxdata=variables.orderServices.buyOrder(rc.cid);
       return rc.ajaxdata;
    }

     public any  function myorders(rc){

       rc.show=variables.orderServices.getOrder();

    }

   
}