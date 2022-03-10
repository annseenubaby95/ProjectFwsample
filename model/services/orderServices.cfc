/**
 * orderServices
 *
 * @author loremine
 * @date 9/3/22
 **/
component accessors=true output=false persistent=false {

property mainServices;

public query function updatetocart(required numeric cid=0){

	cartid=getcartid(arguments.cid)
	local.total=cartid.price*arguments.qty

	 return queryExecute("update cart set quantity=:qty,total=:tot  where cartid=:id",{qty = { value = arguments.qty, cfsqltype = 'integer'},tot = { value = local.total, cfsqltype = 'integer' },id = { value = arguments.cid, cfsqltype = 'integer' }})

    }

public query function buyOrder(required numeric cid=0){

	getcart=getcartid(arguments.cid)
	order=getorderall().recordCount


    if (order==0){
     	queryService=new query()
        result=queryService.execute(sql="SELECT MAX(regid) as top from registration")
        max_id=result.getResult();
        var local.id=max_id.top+1
    	}
    else
    	{
    	local.id=0;
    	}
    local.time=datetimeformat(now(),'yyyy-mm-dd HH:nn:ss')
    queryExecute("insert into product_order(order_id,regid,pcode,qty,price,total_price,order_date) values(?,?,?,?,?,?,?)",[local.id,session.id,getcart.pcode,getcart.quantity,getcart.price,getcart.total,local.time])
	return queryExecute("delete from cart where cartid=:id",{id={value=arguments.cid,cfsqltype = 'integer'}} )

  	}
public query function OrderItem(required numeric pid=0,numeric qty,numeric price=0){

	getcart=mainServices.getproduct(arguments.pid)
	order=getorderall().recordCount
    if (order==0){
     	queryService=new query()
        result=queryService.execute(sql="SELECT MAX(regid) as top from registration")
        max_id=result.getResult();
        var local.id=max_id.top+1
    	}
    else
    	{
    	local.id=0;
    	}
    local.total=arguments.qty*arguments.price
    local.time=datetimeformat(now(),'yyyy-mm-dd HH:nn:ss')
    return queryExecute("insert into product_order(order_id,regid,pcode,qty,price,total_price,order_date) values(?,?,?,?,?,?,?)",[local.id,session.id,arguments.pid,arguments.qty,arguments.price,local.total,local.time])

  	}
  	public query function getorderall(){

       return queryExecute("select r.*,p.pro_name,o.* from product_order as o inner join product as p on p.pcode=o.pcode inner join registration as r on r.regid=o.regid" )
    }

    public query function getOrder(){

       return queryExecute("select o.*,p.pro_name from product_order as o inner join  product as p on p.pcode=o.pcode where o.regid=:id",{id={value=session.id,cfsqltype = 'integer'}} )
    }

     public query function getcartid(required numeric cid){

       return queryExecute("select * from cart where cartid=:cid",{  cid = { value = arguments.cid, cfsqltype = 'integer'} } )
    }


}