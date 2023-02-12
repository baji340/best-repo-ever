({
    handleLWCEvent : function(component, event, helper) {
        alert('LWC event handled');

        const childcompname= event.getParam('childcompname');

        const childcompdescription= event.getParam('childcompdescription');

        alert('childcompname is:'+childcompname);

        alert('childcompdescription is:'+childcompdescription);
    }
})