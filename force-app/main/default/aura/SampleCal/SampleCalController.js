({
	doAdd : function(component, event, helper) {
		var input1=component.get("v.input1");
        var input2=component.get("v.input2");
        var result=parseInt(input1)+parseInt(input2);
        component.set("v.outputvalue",result);
	},
})