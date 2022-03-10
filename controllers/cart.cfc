/**
 * cart
 *
 * @author loremine
 * @date 9/3/22
 **/
component accessors=true output=false persistent=false {

	function init( fw ) {
    variables.fw = fw;
    return this;
}

property CartServices;
property mainServices;
public void function addCart(rc){

	if(structKeyExists(rc,'pcode')&& rc.pcode>0){
			rc.getpro=variables.mainServices.getproduct(rc.pcode);

	        rc.add_cart=variables.CartServices.addTocart(rc.pcode,rc.getpro.price)

            variables.fw.redirect(action="customer.userhome");
        }

	}
public any  function updatecart(rc){

       rc.upcart=variables.cartServices.updatetoCart(rc.qty,rc.cid)
	   rc.showcart=variables.cartServices.getcartid(rc.cid)
       rc.ajaxdata=rc.showcart.price*rc.qty;

       return rc.ajaxdata
    }
 public void function myCart(rc){
        rc.show=variables.cartServices.showCart(session.id)
        //variables.fw.redirect(action="cart.mycart");
    }

    public any  function itemRemovecart(rc){

       rc.ajaxdata=variables.cartServices.itemRemove(rc.cid);
      	 return rc.ajaxdata;
    }
}