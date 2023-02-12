public class Contact_List {

    @auraEnabled
    public static list<Contact> getCall(string accName){
        Account acc=[select id from Account where name=:accName];
        list<contact> contacts=[select id,LastName,FirstName,Phone from contact where id=:acc.id];
        return contacts;
    }
}