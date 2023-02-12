public with sharing class LoanAccountController {
    @AuraEnabled(cacheable = true)
    public static List<Account> getloans(string recordId)
    {
        return [SELECT Id, Name,Number_of_Contacts__c,NumberofLocations__c from Account where id=:recordId];
    }
    @AuraEnabled
    public static string updateRecord(String accId){
        System.debug('@@@@AccountId@@@'+accId);
        Account acc=[select Id,Name,Number_of_Contacts__c,NumberofLocations__c from Account where Id=:accId];
        acc.Number_of_Contacts__c=0;
        acc.NumberofLocations__c=0;
        try{
            update acc;
        }
        catch (Exception e) {
            System.debug('unable to update the record due to'+e.getMessage());
        }
        return acc.id;
    }
}