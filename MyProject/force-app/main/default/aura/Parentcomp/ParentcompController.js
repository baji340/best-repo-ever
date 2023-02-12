({
	doclick : function(component, event, helper) {
		var childComp=component.find('Childcomp');
        childComp.child('i am from parent comp');
	}
})