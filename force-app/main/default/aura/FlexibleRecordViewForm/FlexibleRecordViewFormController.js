({
    init : function(cmp, event, helper) {
        //helper.setColumns(cmp);
    },
    setColumns : function(cmp, event, helper){
        var action = cmp.get('c.listAllFields');
        console.log('action'+action);
        action.setParams({
            
        });
        action.setCallback(this,$A.getCallback(
            function(response){
                var state = response.getState();
                if(state === 'SUCCESS'){
                    console.log('field data is:' + JSON.stringify(response.getReturnValue()));
                    var resp = response.getReturnValue();
                    cmp.set('v.columnList',response.getReturnValue().fieldDetails);
                }else if(state === 'ERROR'){
                    var error = response.getError();
                    console.error(error);
                }
            }
        ));
        $A.enqueueAction(action);
    }
})