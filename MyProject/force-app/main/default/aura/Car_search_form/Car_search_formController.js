({
	
    onchangemethod : function(component, event, helper) {
		var componentid=component.find("cartypelist").get("v.value");
        alert(componentid+'Option selected');
        },
    doinit : function(component, event, helper) {
			component.set("v.cartypes",['Sports car','Luxury car','Van']);
        },
})