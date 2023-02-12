({
	handleClick : function(component, event, helper) {
		alert(component.isValid());
        alert(component.getName());
        alert(component.get('v.whom'));
        alert(component.set('v.whom','baji'));
	}
})