global class batchclassex implements database.Batchable<sobject> {
    
    global database.QueryLocator start(database.BatchableContext bc){
       return database.getQueryLocator('select name from opportunity');
        
    }
    global void execute(database.BatchableContext bc,list<opportunity> scope){
        for(opportunity op : scope){
            op.StageName='closed Won';
        }
        update scope;
}
    global void finish(database.BatchableContext bc){
        
    }

}