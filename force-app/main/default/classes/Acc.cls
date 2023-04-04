public with sharing class Acc {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
            return [select Id,name,Phone,industry from Account limit 10];

    }
    @AuraEnabled
    public static List<Account> getAllAccounts(){
        system.debug('Entered');
        return [select Id,name,Phone,industry from Account limit 10];

    }
    @AuraEnabled
    public static integer getsum( integer firstnumber,integer secondnumber){
        return (firstnumber+secondnumber);
    }
}