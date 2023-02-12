({
	doinit : function(component, event, helper) {
		var actions=component.get("c.Contactlist");
        actions.setparams({});
        actions.setCallback(this,function(response){
            var responsevalue=response.getReturnValue();
        },'SUCCESS');
        $A.enqueueAction(actions);
	}
})