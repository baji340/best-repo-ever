({
    receivesEvent : function(component, event, helper) {
         var message = event.getParam("message");
             component.set("v.notificationMsg", message +' (in handler)');
        }
})