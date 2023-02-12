public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {

    /**
     * コンストラクタ
     */
    public LeadProcessor() {
    
    }

    /**
     * Start
     */
    public Database.QueryLocator start(Database.BatchableContext BC) {
        String query = 'SELECT Id FROM Lead';
        return Database.getQueryLocator (query);
    }
    
    /**
     * Execute
     */
    public void execute(Database.BatchableContext BC, List<Lead> leads) {
        for (Lead l : leads) {
            l.LeadSource  = 'Dreamforce';
        }
        update leads;
    }
    
    /**
     * Finish
     */
    public void finish(Database.BatchableContext BC) {
        
    }
}