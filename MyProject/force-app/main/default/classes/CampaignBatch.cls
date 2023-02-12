global class CampaignBatch implements Database.Batchable<sObject>{
    //public list<Campaign> CampaginList=new list<Campaign>();
    global Database.QueryLocator start(Database.BatchableContext BC){
        string query='select id, Name from Campaign where Name=Test1';
        return Database.getQueryLocator(query);
        
        
    }
    global void execute(Database.BatchableContext BC, List<Campaign> scope){
        system.debug('+++++++++');
        for(Campaign c : scope) {        
            // Update the Account Name 
            c.Status='Planned';
        }
        try {
            // Update the Account Record
            update scope;
         	system.debug('+++++++++++');
        } catch(Exception e) {
            System.debug(e);
        }
         
    }
    global void finish(Database.BatchableContext BC){
        
    }
}