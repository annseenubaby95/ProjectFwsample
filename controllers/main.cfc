/**
 * main
 *
 * @author loremine
 * @date 3/3/22
 **/
component accessors=true  {

function init( fw ) {
    variables.fw = fw;
    return this;
}

property mainServices;
property greetingService;
property orderServices;
public void function default(rc){

 		/*param name="rc.name" default="anonymous";
        rc.name = variables.greetingService.greet( rc.name );
        param name="rc.a1" default="";
		param name="rc.a2" default="";*/
		 variables.fw.redirect("login.login");

   }


public void function userhome(rc){

 		/*param name="rc.name" default="anonymous";
        rc.name = variables.greetingService.greet( rc.name );
        param name="rc.a1" default="";
		param name="rc.a2" default="";*/
		rc.show=variables.mainServices.getproductall();

   }
 /*public any function add_category(rc){
 	param name="rc.catcode" default="0";
	param name="rc.cat_name" default="1";

        if(rc.id==0){
            //rc.get=variables.adminServices.catName(rc.catName)

            if(rc.get.recordCount==0){
                rc.add=variables.mainServices.addCategory(rc.id,rc.catName);
                rc.message = ["Added Successfully"];
                variables.fw.redirect(action="admin.add_category",preserve='message')
            }
            else{
                rc.message = ["Already Added"];
                variables.fw.redirect(action="admin.add_category",preserve='message')
            }
        }
        rc.add=variables.adminServices.addCategory(rc.id,rc.catName);
        variables.fw.redirect("admin.edit_category")
    }*/


public void function add_category(rc){

        if (structkeyexists(rc,'id') && rc.id>0){
            rc.title="Edit Category"
            rc.button="update"
            rc.get=variables.mainServices.getCategory(rc.id)
           	rc.cat=rc.get.cat_name
          	rc.id=rc.id
          //	writedump(rc.cat)

        }
        else{
            rc.button="Add"
            rc.title="Add Category"
            rc.cat=""
            rc.id=0
            rc.show=variables.mainServices.getcategoryall();

        }


    }

public void function add_category_action(rc){



		 		rc.add=variables.mainServices.addCategory(rc.catcode,rc.cat_name);
                rc.message = ["Added Successfully"];
                //writeDump(rc.add);
                rc.show=variables.mainServices.getcategoryall();
                variables.fw.redirect(action="main.add_category",preserve='message');



    }
public void function add_brand(rc){

        if (structkeyexists(rc,'bid') && rc.bid>0){
            rc.title="Edit Brand"
            rc.button="update"
            rc.get=variables.mainServices.getbrand(rc.bid)
           	rc.bname=rc.get.brand_name
          	rc.bid=rc.bid
          //	writedump(rc.cat)

        }
        else{
            rc.button="Add"
            rc.title="Add Brand"
            rc.bname=""
            rc.bid=0
            rc.show=variables.mainServices.getbrandall();

        }


    }

public void function add_brand_action(rc){



		 		rc.add=variables.mainServices.addbrand(rc.bcode,rc.bname);
                rc.message = ["Added Successfully"];
                //writeDump(rc.add);
                rc.show=variables.mainServices.getbrandall();
                variables.fw.redirect(action="main.add_brand",preserve='message');



    }
public void function showedit_category(rc){



		 		rc.show=variables.mainServices.getcategory(rc.id);
		 		variables.fw.redirect(action="main.edit_category",preserve='message');
		 		writeDump(rc.show);

    }
public void function delete_category(rc){

              writedump(rc.id);
		 		rc.add=variables.mainServices.deleteCategory(rc.id);
                rc.message = ["deleted Successfully"];
                variables.fw.redirect(action="main.add_category",preserve='message');
				rc.show=variables.mainServices.getcategoryDetail()
    }
public void function delete_subcategory(rc){


		 		rc.add=variables.mainServices.deletesubCategory(rc.sid);
                rc.message = ["deleted Successfully"];
                variables.fw.redirect(action="main.add_subcategory",preserve='message');
				rc.show=variables.mainServices.getsubcategoryDetail()
    }
public void function delete_brand(rc){


		 		rc.add=variables.mainServices.deletebrand(rc.bid);
                rc.message = ["deleted Successfully"];
                variables.fw.redirect(action="main.add_brand",preserve='message');
				rc.show=variables.mainServices.getbrandDetail()
    }

public void function add_subcategory(rc){

        if (structkeyexists(rc,'sid') && rc.sid>0){
            rc.title="Edit Sub Category"
           	rc.button="update"
            rc.get=variables.mainServices.getsubCategory(rc.sid)
            //writeDump(rc.get)
           	rc.scat=rc.get.subcat_name
          	rc.sid=rc.sid
          	rc.catcode=rc.get.catcode
          	rc.cname=rc.get.cat_name
 			rc.cate=variables.mainServices.getcategoryall();
        }
        else{
            rc.button="Add"
            rc.title="Add Sub Category"
            rc.scat=""
            rc.sid=0
			rc.catcode=""
			rc.cname="Select Category"
            rc.cate=variables.mainServices.getcategoryall();
            rc.show=variables.mainServices.getsubcategoryall();
        }


    }
public void function add_subcategory_action(rc){

if (structkeyexists(rc,'sid') && rc.sid>0){
            rc.add=variables.mainServices.addsubCategory(rc.sid,rc.catcode,rc.scat_name);
            rc.message = ["Updated Successfully"];
            variables.fw.redirect(action="main.add_subcategory",preserve='message')
        }
        else{
            	rc.add=variables.mainServices.addsubCategory(rc.sid,rc.catcode,rc.scat_name);
                rc.message = ["Added Successfully"];
                variables.fw.redirect(action="main.add_subcategory",preserve='message');

        }
				rc.show=variables.mainServices.getsubcategoryall();


    }

 public void function add_product(rc){
        if (structkeyexists(rc,'pid')&& rc.pid>0){
            rc.title="Edit Product"
            rc.getpro=variables.mainServices.getProduct(rc.pid)

        }
        else {
            rc.title="Add Product"

        }
        rc.showsub=variables.mainServices.getsubcategoryall()
        rc.showcat=variables.mainServices.getcategoryall()
        rc.brand=variables.mainServices.getbrandall()
        rc.pro=variables.mainServices.getproductall()
    }


   public void function addProduct_action(rc){

        if (structkeyexists(rc,'pid') && rc.pid>0){
            rc.add=variables.mainServices.addProduct(rc.pid,rc.productName,rc.cats,rc.subs,rc.prices,rc.brand,rc.Description)
            rc.message = ["Updated Successfully"];
            variables.fw.redirect(action="main.add_product",preserve='message')
        }
        else{
            rc.product=variables.mainServices.getproname(rc.productName)
            if(rc.product.recordcount==0){
                rc.add=variables.mainServices.addProduct(rc.pid,rc.productName,rc.cats,rc.subs,rc.prices,rc.brand,rc.Description)
                rc.message = ["Product Added Successfully"];
                variables.fw.redirect(action="main.add_product",preserve='message')
            }
            rc.message = ["Product Already Added"];
            variables.fw.redirect(action="main.add_product",preserve='message')
        }
    }

public any function getsubcat(rc){


        rc.sub=variables.mainServices.getsub(rc.ID)
        writedump(rc.sub);
        cfloop (query=rc.sub){
            var sub=writeOutput("<option value='#rc.sub.subcode#'>#rc.sub.subcat_name#</option>")
        }
 }

public void function viewusers(rc){

	rc.show=variables.mainServices.getuserDetail()
	}
  public any  function orders(rc){

       rc.show=variables.orderServices.getOrderall();

    }
}