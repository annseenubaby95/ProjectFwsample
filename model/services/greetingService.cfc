/**
 * greetings
 *
 * @author loremine
 * @date 4/3/22
 **/
component  accessors=true output=false persistent=false  {

public any function greet( string name ) {
        local.a="its from model  rr" & arguments.name;
		return local.a;
    }
}