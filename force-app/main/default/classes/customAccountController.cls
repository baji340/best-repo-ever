public with sharing class customAccountController {

    public customAccountController() {

 

    }

    @AuraEnabled(cacheable=true)

    public static List<Account> getAccountRecordMethod(String accNameParamInApex) {

 

        String accNameKey = '%'+accNameParamInApex+'%';

 

    List<Account> accList=[SELECT Id, Name, Industry

 

        FROM Account

 

        Where name Like: accNameKey];

 

        return accList;

 

    }

}