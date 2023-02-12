@istest
private class TestRestrictContactByName {
    @istest static void testname(){
        contact c = new contact(firstname='Satya',lastname='INVALIDNAME');
        test.startTest();
        database.SaveResult result = database.insert(c,false);
        test.stopTest();
        system.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', result.getErrors()[0].getMessage());
    }
}