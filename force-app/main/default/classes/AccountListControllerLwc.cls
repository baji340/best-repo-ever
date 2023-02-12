public class AccountListControllerLwc {
    
    @AuraEnabled(cacheable=true)
    public static list<Account> queryAccountsByRevenue(decimal annualRevenue){
        return [
        SELECT Name
        FROM Account
        WHERE annualRevenue >= :annualRevenue
    ];
    }

}