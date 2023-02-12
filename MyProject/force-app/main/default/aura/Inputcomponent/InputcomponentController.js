({
	CAdd : function(component, event, helper) {
			var A=component.find("A").get("v.value");
        	console.log(A);
        	var B=component.find("B").get("v.value");
        	console.log(B);
        	var C=parseInt(A)+parseInt(B);
        	console.log(C);
        	component.find("C").set("v.value",C);
    },
    CMul : function(component, event, helper) {
			var A=component.find("A").get("v.value");
        	console.log(A);
        	var B=component.find("B").get("v.value");
        	console.log(B);
        	var C=parseInt(A)*parseInt(B);
        	console.log(C);
        	component.find("C").set("v.value",C);
    },
  Reset : function(component, event, helper) {
			component.find("A").set("v.value",0);
        	component.find("B").set("v.value",0);
        	component.find("C").set("v.value",0);
    }
})