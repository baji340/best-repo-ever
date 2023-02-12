trigger autonumtype on Task (before insert) {
    
    list<Task> l= [SELECT Id,AMS_Taskid__c FROM Task where AMS_Taskid__c !=:null order by AMS_Taskid__c desc limit 1];
	string maxlead = l[0].AMS_Taskid__c;

   for(Task li:Trigger.new) {
   if(li.RecordTypeId != '0122v000002ROlhAAG'){
 
    //li.AMS_Taskid__c = string.valueOf(maxlead)+1;
    }
   }

}