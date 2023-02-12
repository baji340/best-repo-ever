//Trigger to update Job Number text field as Auto Number field based on Record Type
trigger TriggerOnJob on Task (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        for(Task job : trigger.New){
            //Display error if someone manually tries to enter Job Number
            if(job.Job_Number__c != null){
                job.addError('You are not allowed to enter Job Number manually. Its auto generated.');
            }
        }
		//TriggerOnJobHandler.updateJobNumberOnJob(trigger.New);
    }
    
}