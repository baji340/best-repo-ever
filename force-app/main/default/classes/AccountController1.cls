public class AccountController1{
	@AuraEnabled
    public static List<Account> getAccounts(){
        return [SELECT
               Id, Name, Phone, Rating
               FROM Account LIMIT 10];
    }
}