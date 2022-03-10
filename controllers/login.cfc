/**
 * login
 *
 * @author loremine
 * @date 8/3/22
 **/
component accessors=true  {

function init( fw ) {
    variables.fw = fw;
    return this;
}

property customerServices;
function default(rc){
        variables.fw.redirect("login.login");
    }


     public void function savecust(rc){
        rc.customer=variables.customerServices.savecustomer(rc.id,rc.fullname,rc.phonenumber,rc.email,rc.address,rc.password)
        variables.fw.redirect(action="login.default");
    }

    public void function userlogin(rc) {
        rc.user=variables.customerServices.login(rc.uname,rc.password)
        writeDump(rc.user.utype);

        if(rc.user.recordCount == 1 && rc.user.utype == 'admin'){

            session.auth.isLoggedIn = true;
            session.id = rc.user.uid;
            variables.fw.redirect(action="main.adminhome")
        }
        else if (rc.user.recordCount == 1 && rc.user.utype == 'customer'){
            session.auth.isLoggedIn = true;
            session.id = rc.user.uid;
            writeOutput(session.id);

            variables.fw.redirect(action="customer.userhome")
        }
         else
         {
        rc.message = ["Username or Password is Incorrect"];
        variables.fw.redirect(action="login.login",preserve='message');
         }

    }

    public void function logout(rc){
        session.auth.isLoggedIn = false;
        structdelete(session,"id")
        variables.fw.redirect(action="login.default");
    }
}