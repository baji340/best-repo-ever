public with sharing class AccountController{
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [SELECT Id, Name, Phone FROM ACCOUNT ORDER BY CreatedDate desc Limit 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> findAccList(String keyword){
        String key='%'+keyword+'%';
        return [SELECT Id, Name,Phone FROM ACCOUNT WHERE Name LIKE:key ORDER BY CreatedDate desc Limit 10];
    }
    @AuraEnabled(cacheable=true)
    public static Account getSingleAccount(){
        return [SELECT Id, Name, Phone FROM ACCOUNT ORDER BY CreatedDate desc Limit 1];
    }
    @AuraEnabled
    public static List<Account> imperitivecall(){
        return [SELECT Id, Name, Phone FROM ACCOUNT ORDER BY CreatedDate desc Limit 10];
    }

}