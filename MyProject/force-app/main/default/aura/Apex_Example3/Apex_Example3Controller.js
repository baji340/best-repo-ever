({
	invoke : function(component, event, helper) {
		var a=component.find("Amount").get("v.value");
        var R=component.find("Rate").get("v.Value");
        var Y=component.find("Year").get("v.value");
        var am=parseInt(a);
        var Ra=parseInt(R);
        var yea=parseInt(Y);
        var action=component.get("c.Intrest");
        action.setParams({"Amount":am,"Rate":Ra,"year":yea});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.intrest",result);
                console.log("Result:"+result)
            }else{
                console.log('State failed');
            }
        });
        $A.enqueueAction(action);
	}
})