/**
 * mainServices
 *
 * @author loremine
 * @date 4/3/22
 **/
component  accessors=true output=false persistent=false  {




public void function savecustomer(required numeric id=0,required string name="",string phno="",string email="",string address="",string password=""){


  		queryService=new query()
        result=queryService.execute(sql="SELECT MAX(regid) as top from registration")
        max_id=result.getResult();
        var local.id=max_id.top+1
     queryExecute("insert into registration(regid,name,email,phno,address) values(?,?,?,?,?)",
     [local.id,arguments.name,arguments.email,arguments.phno,arguments.address])
     queryExecute("insert into login(uid,utype,uname,password) values(?,?,?,?)",[local.id,'customer',arguments.email,arguments.password])

  	}

public query function login(required string uname="",required string password="",){
  	   return queryExecute("select uid,utype from login where uname=:uname and password=:password ",
  	   { uname={value = arguments.uname, cfsqltype = 'varchar'},password={value = arguments.password, cfsqltype = 'varchar'}})

  	}

 public query function getuserDetail(){

    }

}