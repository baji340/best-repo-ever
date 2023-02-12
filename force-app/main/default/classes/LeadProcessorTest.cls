@isTest
private class LeadProcessorTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    static testMethod void LeadProcessorTest() {
        
        System.runAs(testAdminUser) {
            
            List<Lead> leads = new List<Lead>();
            for (Integer i = 0; i < 200; i++) {
                leads.add(new Lead(LastName = 'Yoshikawa', Company = 'T.Yoshikawa Labs'));
            }
            insert leads;
            System.assertEquals(leads.size(), 200);

            Test.startTest();
            
            LeadProcessor batchable = new LeadProcessor();
            Database.executeBatch(batchable);
            
            Test.stopTest();
            
            List<Lead> results = [SELECT Id,LeadSource FROM Lead];
            for (Lead l : results) {
                System.assertEquals(l.LeadSource, 'Dreamforce');
            }
            System.assertEquals(results.size(), 200);
        }
    }
}