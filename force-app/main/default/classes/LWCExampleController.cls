public with sharing class LWCExampleController {

    @AuraEnabled
    public static void saveAccountRecord(Account objAcc){
        try {
            insert objAcc;
            //return objAcc;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}