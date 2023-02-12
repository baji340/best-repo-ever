public class ContactlistController1 {
    @auraEnabled
    public static list<contact> getContactlist(){
        list<contact> Contactlist=new list<contact>([select id,Lastname,FirstName,Email from contact]);
            return Contactlist;
    }

}