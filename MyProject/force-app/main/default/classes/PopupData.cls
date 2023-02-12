public with sharing class PopupData {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        List<Account> acc = new List<Account>();
        acc = [select Id, Name from Account Limit 5];
        return acc;
    }
}