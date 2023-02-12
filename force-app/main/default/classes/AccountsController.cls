public class AccountsController {
	@auraEnabled
    public static list<Account> fetchaccounts(){
        return [select id,name,industry from Account limit 1];
    }
}