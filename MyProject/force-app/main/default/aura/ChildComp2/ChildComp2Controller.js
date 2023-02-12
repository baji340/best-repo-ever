({
 doHandleEvent : function(component, event, helper) {
        var aeEvent=$A.get("e.c:AppEvent");
        aeEvent.setParams({
            storeMessage : component.get("v.textMessage")
            
        });
        aeEvent.fire();
 }

})