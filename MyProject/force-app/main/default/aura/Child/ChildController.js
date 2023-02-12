({
    childComponentEvent : function(cmp, event,helper) { 
        //Get the event using registerEvent name. 
        var cmpEvent = cmp.getEvent("sampleCmpEvent"); 
        //Set event attribute value
        cmpEvent.setParams({"message" : "uhc:mr:med-adherence:pharmacy-chat"}); 
        cmpEvent.fire(); 
    }
})