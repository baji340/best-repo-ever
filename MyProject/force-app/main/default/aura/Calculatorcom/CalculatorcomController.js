({
	doadd : function(component, event, helper) {
        var num1=component.get('v.value1');
        var num2=component.get('v.value2');
        alert(parseInt(num1)+parseInt(num2));
	},
    dosub : function(component, event, helper) {
            var num1=component.get('v.value1');
        var num2=component.get('v.value2');
        alert(parseInt(num1)-parseInt(num2));
	},
    domul : function(component, event, helper) {
            var num1=component.get('v.value1');
        var num2=component.get('v.value2');
        alert(parseInt(num1)*parseInt(num2));
	},
    dodiv : function(component, event, helper) {
            var num1=component.get('v.value1');
        var num2=component.get('v.value2');
        alert(parseInt(num1)/parseInt(num2));
	},
})