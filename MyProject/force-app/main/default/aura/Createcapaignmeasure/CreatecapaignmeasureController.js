({
    handleOnload : function(component, event, helper) {
       
    
},
    
	doInit : function(component,event,helper){
        
        //set parent campaignId
        var pageRef = component.get("v.pageReference");
        //console.log(JSON.stringify(pageRef));
        var state = pageRef.state; // state holds any query params
        //console.log('state = '+JSON.stringify(state));
        var base64Context = state.inContextOfRef;
        //console.log('base64Context = '+base64Context);
        if (base64Context.startsWith("1\.")) {
            base64Context = base64Context.substring(2);
            console.log('base64Context = '+base64Context);
        }
        var addressableContext = JSON.parse(window.atob(base64Context));
        //console.log('addressableContext = '+JSON.stringify(addressableContext));
        component.set("v.parentId", addressableContext.attributes.recordId);
		helper.getstate(component);
},
    onPageReferenceChanged : function(component, event, helper) {
        $A.get('e.force:refreshView').fire();
    },
    close : function(component, event, helper) {
        component.set("v.openmodal", false);
        $A.get('e.force:refreshView').fire();
		//alert(component.get("v.parentId"));
      //alert('nothing'+JSON.stringify(event.getParam("response").id));
      var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      //"recordId": event.getParam("response").id,
      "recordId":component.get("v.parentId"),
      "slideDevName": "view" 
    });
      		navEvt.fire();
    },

  handleOnSubmit : function(component, event, helper) {
    event.preventDefault();
    var fields = event.getParam("fields");
    fields["MeasuresId"] = component.get("v.pid");
    component.find("form").submit(fields);
      
},
    /*handleError : function(component, event, helper) {
    var error = event.getParam("error");
    //console.log(error);
    component.find("notificationsLibrary").showToast({ "variant":"error", "title": "Unexpected Error Here", "message": "Measure already existed" });
},*/
  handleOnSuccess : function(component, event, helper) {
  		
      //alert('nothing'+JSON.stringify(event.getParam("response").id));
      var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      //"recordId": event.getParam("response").id,
      "recordId":component.get("v.parentId"),
      "slideDevName": "view"

      
      
    });
   navEvt.fire();
      
   $A.get('e.force:refreshView').fire();
},
  checkMesure : function(component, event, helper){
   
      var parentId = component.find("MesureLookup").get("v.value");
     	alert(parentId);
      if(parentId != null && parentId !='')
      {
       var action = component.get('c.getmesuredetails'); 
        action.setParams({
            "parentId" : parentId 
        });
        action.setCallback(this, function(a){
            var state = a.getState(); // get the response state
            if(state == 'SUCCESS') {
                var result = a.getReturnValue();
                //console.log("result=="+JSON.stringify(result));
                if(result != null)
                {
                    //alert(result);
                    component.set("v.pid",result.Id);
                    component.set("v.MeasureDomain", result.Domain__c);
                    component.set("v.MeasureName", result.Name);
                    //component.set('v.hasMeasure',true);
                    //component.set('v.hasDomain',true);
                    //helper.setColumns(component);
                            var a = component.get('c.setColumns');
                            $A.enqueueAction(a);
                    
                }else
                {
                    
                    
       			}
            }
            
        });
        $A.enqueueAction(action);
      }
      else
      {
           
          component.set('v.hasMeasure',false);
         
          
      }
       
} ,
    
    setColumns : function(component, event, helper){
         var parentId = component.find("MesureLookup").get("v.value");
 		alert('--------------'+parentId)
        var action = component.get('c.listAllFields');
        console.log('action'+action);
        action.setParams({
            "mesureid" : parentId
        });
        action.setCallback(this,$A.getCallback(
            function(response){
                var state = response.getState();
                if(state === 'SUCCESS'){
                    console.log('field data is:' + JSON.stringify(response.getReturnValue()));
                    var resp = response.getReturnValue();
                    component.set('v.columnList',response.getReturnValue().fieldDetails);
                }else if(state === 'ERROR'){
                    var error = response.getError();
                    console.error(error);
                }
            }
        ));
        $A.enqueueAction(action);
    }   
    
})