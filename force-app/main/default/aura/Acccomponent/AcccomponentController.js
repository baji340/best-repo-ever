({
        clear : function (component, helper) {
        alert('inside Success');
        //component.find('accField').forEach(function(f) {
        //f.reset();
        component.set("v.reloadForm", false);
        component.set("v.reloadForm", true);
        },
        handleSubmit:function(component, helper){
        alert('inside submit');
        },      
        handleError:function(component, helper){
        console.log('error');
        }
        })