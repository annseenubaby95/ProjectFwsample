/**
 * customer
 *
 * @author loremine
 * @date 9/3/22
 **/
component accessors=true  {


property mainServices;

public void function default(rc){

 variables.fw.redirect("customer.userhome");
   }


public void function userhome(rc){
		rc.show=variables.mainServices.getproductall();

   }
}