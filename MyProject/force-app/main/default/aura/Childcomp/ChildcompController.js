({
	handlechild : function(component, event, helper) {
		var params=event.getParam('arguments');
        if(params){
            var par1=params.param1;
            alert(par1);
        }
	}
})