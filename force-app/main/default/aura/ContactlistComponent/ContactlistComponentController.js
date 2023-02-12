({
	doinit : function(component, event, helper) {
		var actions=component.get("c.getContactlist");
        //actions.setparams({});
        actions.setCallback(this,function(response){
            var responsevalue=response.getReturnValue();
            console.log(responsevalue)
            component.set('v.Contactlist',responsevalue);
        });
        $A.enqueueAction(actions);
	},
    handleClick :function(component, event, helper) {
       var eventSource=event.getSource().get("v.name");   
        console.log(eventSource);
        component.set('v.recordid',eventSource);
    }
})