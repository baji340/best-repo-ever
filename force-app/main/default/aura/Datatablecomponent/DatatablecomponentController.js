({
	Fetchacc : function(component, event, helper) {
        component.set('v.columns',[{label:'Name',fieldname:'Name',type:'text'},
                                  {label:'industry',fieldname:'industry',type:'text'}]);
        var action=component.get("c.fetchaccounts");
        action.setParams({});
        action.setCallback(this,function(response){
                           var state=response.getState();
                                        if(state==="SUCCESS"){
                                            var recordList=response.getReturnValue();
                                            console.log(recordList);
                                            component.set("v.accountslist",recordList);
                                        }
                           });
        				$A.enqueueAction(action);
	}
})