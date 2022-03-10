/**
 * mainServices
 *
 * @author loremine
 * @date 4/3/22
 **/
component  accessors=true output=false persistent=false  {


public void function addCategory( numeric catcode=0, required string cat_name='null'){

	cat=getCategory(arguments.catcode).recordcount
	if (arguments.catcode>0 && cat){

            queryExecute("update category set cat_name=:name where catcode=:id",{id = { value = arguments.catcode, cfsqltype = 'integer'},name = { value = arguments.cat_name, cfsqltype = 'varchar' }})
     }


	if(arguments.catcode==0)
  	{
     queryExecute("insert into category(catcode,cat_name) values(?,?)",[0,arguments.cat_name])
  	}

  	}
 public void function addsubCategory( numeric subcode=0,numeric catcode=0, required string scat_name='null'){

	scat=getsubCategory(arguments.subcode).recordcount
	if (arguments.subcode>0 && scat){

            queryExecute("update sub_category set subcat_name=:name where subcode=:id",{id = { value = arguments.subcode, cfsqltype = 'integer'},name = { value = arguments.scat_name, cfsqltype = 'varchar' }})
     }


	if(arguments.subcode==0)
  	{
  		queryService=new query()
        result=queryService.execute(sql="SELECT MAX(subcode) as top from sub_category")
        max_id=result.getResult();
        var local.id=max_id.top+1
     queryExecute("insert into sub_category(subcode,catcode,subcat_name) values(?,?,?)",[local.id,arguments.catcode,arguments.scat_name])
  	}

  	}

  	public void function addbrand( numeric bcode=0, required string bname='null'){

	brand=getbrand(arguments.bcode).recordcount
	if (arguments.bcode>0 && brand){

            queryExecute("update brand set brand_name=:name where bcode=:id",{id = { value = arguments.bcode, cfsqltype = 'integer'},name = { value = arguments.bname, cfsqltype = 'varchar' }})
     }


	if(arguments.bcode==0)
  	{
  		queryService=new query()
        result=queryService.execute(sql="SELECT MAX(bcode) as top from brand")
        max_id=result.getResult();
        var local.id=max_id.top+1
     queryExecute("insert into brand(bcode,brand_name) values(?,?)",[local.id,arguments.bname])
  	}

  	}
public void function addproduct(numeric pid=0,string pname="",string ccode="",numeric scode=0,numeric price=0,numeric bcode=0,string Des=""){

	pro=getproduct(arguments.pid).recordcount
	if (arguments.pid>0 && pro){

            queryExecute("update product set subcode=:scode,bcode=:bcode,pro_name=:pname,price=:price,details=:des where pcode=:pid",{pid = { value = arguments.pid, cfsqltype = 'integer'},scode = { value = arguments.scode, cfsqltype = 'integer'},bcode = { value = arguments.bcode, cfsqltype = 'integer'},pname = { value = arguments.pname, cfsqltype = 'varchar' },price = { value = arguments.price, cfsqltype = 'integer'},des = { value = arguments.des, cfsqltype = 'varchar'}})
     }


	if(arguments.pid==0)
  	{
  		queryService=new query()
        result=queryService.execute(sql="SELECT MAX(pcode) as top from product")
        max_id=result.getResult();
        var local.id=max_id.top+1
     queryExecute("insert into product(pcode,subcode,bcode,pro_name,price,details) values(?,?,?,?,?,?)",[local.id,arguments.scode,arguments.bcode,arguments.pname,arguments.price,arguments.des])
  	}

  	}

public void function deleteCategory(numeric id=0){
  	   queryExecute("delete  from  category where catcode=?",[arguments.id])

  	}
public void function deletesubCategory(numeric id=0){
  	   queryExecute("delete  from  sub_category  where subcode=?",[arguments.id])

  	}
  public void function deletebrand(numeric id=0){
  	   queryExecute("delete  from  brand where bcode=?",[arguments.id])

  	}

  public query function getCategory(required numeric id){
        return queryExecute("select catcode, cat_name from category where catcode=:id",{ id = { value = arguments.id, cfsqltype = 'integer' } } )
    }

public query function getcategoryall(){
	return queryExecute("select catcode, cat_name from category")

    }

public query function getsubCategory(required numeric sid){

       return queryExecute("select s.subcode,s.subcat_name,c.cat_name,c.catcode  from sub_category as s  inner Join category as c on s.catcode=c.catcode where s.subcode=:id",{ id = { value = arguments.sid, cfsqltype = 'integer' } } )
    }
 public query function getsub(required numeric ID){
         return queryExecute("select subcode,subcat_name from sub_category where catcode=:ID",{ID={value=arguments.ID, cfsqltype="integer"}})


    }
public query function getsubcategoryall(){
	return queryExecute("select s.subcode,s.subcat_name,c.cat_name  from sub_category as s inner join category as c on c.catcode=s.catcode")

    }
     public query function getbrand(required numeric ID){
        return queryExecute("select bcode, brand_name from brand where bcode=:id",{ id = { value = arguments.id, cfsqltype = 'integer' } } )
    }
    public query function getbrandall(){
        return queryExecute("select bcode, brand_name from brand " )
    }
public query function getproductall(){

       return queryExecute("select p.pcode,s.subcat_name,c.cat_name,b.brand_name,p.pro_name,p.price,p.details  from  product as p inner join brand as b on b.bcode=p.bcode inner join  sub_category as s  on p.subcode=s.subcode inner join category  as c on s.catcode=c.catcode  ")
    }

  public query function getproduct(required numeric id){

       return queryExecute("select s.subcode,s.subcat_name,c.catcode,p.pcode,s.subcat_name,c.cat_name,b.brand_name,p.pro_name,p.price,p.details,b.bcode,b.brand_name  from  product as p inner join brand as b on b.bcode=p.bcode inner join  sub_category as s  on p.subcode=s.subcode inner join category as c on  s.catcode=c.catcode   where p.pcode=:id",{ id = { value = arguments.id, cfsqltype = 'integer' } } )
    }
   public query function getproname(required string pname){

       return queryExecute("select s.subcode,s.subcat_name,c.catcode,p.pcode,s.subcat_name,c.cat_name,b.brand_name,p.pro_name,p.price,p.details,b.bcode,b.brand_name  from  product as p inner join brand as b on b.bcode=p.bcode inner join  sub_category as s  on p.subcode=s.subcode inner join category as c on  s.catcode=c.catcode   where p.pro_name=:id",{ id = { value = arguments.pname, cfsqltype = 'varchar' } } )
    }
 public query function getuserDetail(){
        return queryExecute("select regid, name,email,phno,address from registration")
    }

}