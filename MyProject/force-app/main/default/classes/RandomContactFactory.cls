public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numcts, String lastn){
        List<Contact> cts = new List<Contact>();
        
        for(Integer i=0;i<numcts;i++){
        Contact c = new Contact(Firstname='Test'+ i);
            cts.add(c);
            }
        return cts;
    
     }
        
}