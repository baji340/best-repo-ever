({
	fetchAccounts : function(component, event, helper) {
		var action=component.get("c.fetchAccts");
      action.setParams({
            accountId : component.get("v.recordId")
        });
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
               component.set("v.acc", response.getReturnValue());
            }
        else{
                let errors = response.getError();
                let message = 'Unknown error'; 
                // Retrieve the error message sent by the Apex
                if (errors && Array.isArray(errors) && errors.length > 0) {
                    message = errors[0].message;
                }
                console.error(message);
                
            }
        });
        $A.enqueueAction(action);
    },
    closeDeleteModel : function(component, event, helper) {
        $A.get("e.force:closeQuickAction").fire();
        component.set("v.isDeleteModelOpen", false);
    },
    closemodelandDelete : function(component, event, helper) {
        component.set("v.isDeleteModelOpen",false);
        component.find("recordHandler").deleteRecord($A.getCallback(function(deleteResult) {
            
        }));
    },
     handleRecordUpdated: function(component, event, helper) {
        var eventParams = event.getParams();
        if(eventParams.changeType === "CHANGED") {
            // record is changed
        } else if(eventParams.changeType === "LOADED") {
            // record is loaded in the cache
        } else if(eventParams.changeType === "REMOVED") {
            // record is deleted, show a toast UI message
            var resultsToast = $A.get("e.force:showToast");
            resultsToast.setParams({
                "title": "Deleted",
                "type" : "success",
                "message": "The Account was successfully deleted."
            });
            resultsToast.fire();
            var poUrl = "/lightning/o/Account/list?filterName=Recent";
            window.location = poUrl ; 
            
            
        } else if(eventParams.changeType === "ERROR") {
            // there’s an error while loading, saving, or deleting the record
        }
    }, 
        handleSelect: function (component, event, helper)  {
        // This will contain the string of the "value" attribute of the selected lightning:menuItem
        var selectedMenuItemValue = event.getParam("value");
        if(event.getParam("value") === 'Edit'){
            var editRecordEvent = $A.get("e.force:editRecord");
            editRecordEvent.setParams({
                "recordId": component.get("v.acc.Id")
            });
            editRecordEvent.fire(); 
        }
        
        if(event.getParam("value") === 'Delete'){
            component.set("v.isDeleteModelOpen",true);
        }
        
        if(event.getParam("value") === 'NewContact'){
            var navService = component.find("navService");       
            var pageReference = {
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Contact',
                    actionName: 'new'
                   
                }
            };
            event.preventDefault();
            navService.navigate(pageReference); 
        }
        
        if(event.getParam("value") === 'ExportExclusionsReport'){
            var modalBody5;
            var recId= component.get('v.recordId');
            $A.createComponent("c:exclusionsReporting", {recordId:recId},
                               function(content, status) {
                                   if (status === "SUCCESS") {
                                       modalBody5 = content;
                                       component.find('overlayLib').showCustomModal({
                                           header: "",
                                           body: modalBody5, 
                                           showCloseButton: true,
                                           closeCallback: function() {
                                           }
                                       })
                                   }                               
                               });
        }
        
        if(event.getParam("value") === 'AddProducts') {
            var modalBody4;
            var recId= component.get('v.recordId');
            $A.createComponent("c:AccountPopulationProductComponent", {recordId:recId},
                               function(content, status) {
                                   if (status === "SUCCESS") {
                                       modalBody4 = content;
                                       component.find('overlayLib').showCustomModal({
                                           header: "",
                                           body: modalBody4, 
                                           showCloseButton: true,
                                           closeCallback: function() {
                                           }
                                       })
                                   }                               
                               });
        }
        },
        closeModel : function(component, event, helper){
        $A.get("e.force:closeQuickAction").fire();
        component.set("v.isOpen", false);
    },
})