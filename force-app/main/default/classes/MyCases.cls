public with sharing class MyCases {
    
    @AuraEnabled
    public static Account getAccountDetails(String parentId){
        Id myId = UserInfo.getUserId();
        System.debug('myId+++++++++++'+parentId);
        List<Account> accList = new List<Account>();
         accList = [Select Id, Name,Rating From Account where id=:parentId and (Name='Golden Incorporated' OR Name='Sam Heath Household' OR Name='Pat Heath Household')];
        if(accList.size() > 0)
        {
            return accList[0];
        }
        else 
            return null;
        
    }
    
    @AuraEnabled
    public static Case saveCase(Case ca) {
        
        // Perform isUpdateable() check here
        upsert ca;
        return ca;
    }}