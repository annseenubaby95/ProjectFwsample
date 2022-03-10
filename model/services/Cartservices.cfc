/**
 * Cartservices
 *
 * @author loremine
 * @date 9/3/22
 **/
component accessors=true output=false persistent=false {


	public void function addTocart(numeric pcode=0,numeric price=0){



	cart=getcart(arguments.pcode).recordcount;


	if (arguments.pcode>0 && cart==0){

            queryExecute("insert into cart(pcode,regid,quantity,total,price) values(?,?,?,?,?)",[arguments.pcode,session.id,1,arguments.price,arguments.price])

     }





  	}

public query function updatetocart(required numeric qty=0,numeric cid=0){

	cartid=getcartid(arguments.cid)
	local.total=cartid.price*arguments.qty

	 return queryExecute("update cart set quantity=:qty,total=:tot  where cartid=:id",{qty = { value = arguments.qty, cfsqltype = 'integer'},tot = { value = local.total, cfsqltype = 'integer' },id = { value = arguments.cid, cfsqltype = 'integer' }})

    }
  public query function itemRemove(required  cid=0){

	return queryExecute("delete from cart where cartid=:id",{id={value=arguments.cid,cfsqltype = 'integer'}} )

    }

  	public query function getcart(required numeric pid){

       return queryExecute("select * from cart where pcode=:pcode and regid=:rid",{ pcode = { value = arguments.pid, cfsqltype = 'integer' }, rid = { value = session.id, cfsqltype = 'integer'} } )
    }

    public query function getcartid(required numeric cid){

       return queryExecute("select * from cart where cartid=:cid",{  cid = { value = arguments.cid, cfsqltype = 'integer'} } )
    }

    public query function showcart(){

       return queryExecute("select p.pcode,p.price,p.pro_name,c.cartid,c.quantity,c.total from cart as c inner join product as p on p.pcode=c.pcode where c.regid=:rid",{ rid = { value = session.id, cfsqltype = 'integer'} } )
    }


}