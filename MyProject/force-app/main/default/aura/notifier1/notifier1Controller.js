({
    fireEvent : function(component, event, helper) {
        var componentEvent = component.getEvent("componentEvent");
            componentEvent.setParams({
                "message":"Event: ComponentEvent is fired."
            });
            componentEvent.fire();  
    }
})