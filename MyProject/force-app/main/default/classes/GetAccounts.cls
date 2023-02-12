public with sharing class GetAccounts {
    public GetAccounts() {

    }
    @AuraEnabled(cacheable=true)
    public static list<Account> getaccount(){
        return [select id,name from Account];
    }
}