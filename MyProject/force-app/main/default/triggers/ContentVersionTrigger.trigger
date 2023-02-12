trigger ContentVersionTrigger on ContentVersion (before insert, after insert) {

    if(Trigger.isInsert && Trigger.isBefore)
    {
        ContentVersionTriggerHandler.handleBeforeInsert(Trigger.new);
    }
    
    if(Trigger.isInsert && Trigger.isAfter)
    {
        ContentVersionTriggerHandler.handleAfterInsert(Trigger.newMap);
    }
    

}