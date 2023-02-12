({handleOnload : function(component, event, helper) {
    var recUi = event.getParam("recordUi");
    
    console.assert(null === recUi.record.id);

    console.assert(null === recUi.record.fields["Account"].displayValue);
    console.assert(null === recUi.record.fields["Account"].value);

    console.assert("Account" === recUi.objectInfos["Account"].label);
    var parentId = component.get("v.parentId");
    component.set('v.hasAccount',false);
    // requires inputFields to have aura:id
    component.find("accountLookup").set("v.value", parentId);
     //component.find("accountName").set("v.value", recUi.objectInfos["Account"].label);
},
  handleOnSubmit : function(component, event, helper) {
    event.preventDefault();
    var fields = event.getParam("fields");
    fields["AccountId"] = component.get("v.parentId");
    component.find("form").submit(fields);
},
  handleOnSuccess : function(component, event, helper) {
  
      //alert('nothing'+JSON.stringify(event.getParam("response").id));
      
      var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": event.getParam("response").id,
      "slideDevName": "detail"
    });
    navEvt.fire();
},
  checkAccount : function(component, event, helper){
   
      var parentId = component.find("accountLookup").get("v.value");
     
      if(parentId != null && parentId !='')
      {
       var action = component.get('c.getAccountDetails'); 
        action.setParams({
            "parentId" : parentId 
        });
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                var result = a.getReturnValue();
                if(result != null)
                {
                    component.set('v.AccountName',result.Name);
                    component.set('v.rating',result.Rating);
                    component.set("v.parentId",result.Id);
                    
                    component.set('v.hasAccount',true);
                }else
                {
                     component.set('v.hasAccount',false);
                   component.set("v.parentId",parentId);
       }
            }
        });
        $A.enqueueAction(action);
      }
      else
      {
           
          component.set('v.hasAccount',false);
          
      }
       
      
     
 } ,
})