({
	parentComponentEvent : function(component, event, helper) {
		
        var pageName = event.getParam("pageName");
        component.set("v.pageName", pageName);
        console.log('pageName'+pageName);
	}
})