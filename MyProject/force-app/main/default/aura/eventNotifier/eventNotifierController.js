({
	fireComponentEvent : function(component, event, helper) {
				// Get the component event by using the
        // name value from aura:registerEvent
        var cmpEvent = component.getEvent("cmpEvent");
        cmpEvent.setParams({
            "pageName" : "A component event fired me. ",
            "siteSectionL1" : "Test",
            "siteSectionL2" : "Test1",
            "siteSectionL3" : "Test3",
            "website"       : "Test4",
            "businessUnit"  : "Test5"
            });
        cmpEvent.fire();

	},
    OnLoad : function(component, event, helper) {
		
    }
})