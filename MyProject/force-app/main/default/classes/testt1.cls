@isTest
private class testt1 {
    
    private static testmethod void testval(){
        list<Account> acc=new list<Account>();
        for(integer i=0;i<200;i++){
            Account a=new Account();
            a.Name='test'+i;
            acc.add(a);
        }
            test.startTest();
        	insert acc;
        	test.stopTest();
        list<Account> listdetails=[select id,description from account where id in :acc];
        for(Account a1:listdetails){
        system.assertEquals(a1.Description, 'Account technology');
            }
        }
    }