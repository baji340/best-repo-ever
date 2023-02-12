({
	helperMethod : function() {
		
	},
    getstate : function(component){
        var campaignid = component.find("campaignidval").get("v.value");
        console.log('campaignid'+campaignid);
        var action = component.get('c.getstate');
        console.log('action'+action);
        action.setParams({
            "campaignid" : campaignid
        });
        action.setCallback(this,$A.getCallback(
            function(response){
                var state = response.getState();
                if(state === 'SUCCESS'){
                    console.log('state value is:' + JSON.stringify(response.getReturnValue()));
                    var resp = response.getReturnValue();
                    component.set('v.Campaginstate',response.getReturnValue());
                    component.set('v.options',response.getReturnValue());
                }else if(state === 'ERROR'){
                    var error = response.getError();
                    console.error(error);
                }
            }
        ));
        $A.enqueueAction(action);
    }   
    
    
})