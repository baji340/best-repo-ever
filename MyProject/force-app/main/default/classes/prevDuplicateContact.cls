public class prevDuplicateContact {
    
    public static void onBefore(list<Contact>existingcons){
        // Set to store email ids
    Set <String> emailSet = new Set<String>(); 
    
    // Iterate through each Contact and add their email and phone number to their respective Sets
    for (contact con:existingcons) {
        emailSet.add(con.email);

    }

    // New list to store the found email
    List <Contact> contactList = new List<Contact>();

    // Populating the list using SOQL
    contactlist = [SELECT email FROM Contact WHERE email IN :emailSet];

    
    for (contact con:existingcons) {
        If (contactList.size() > 0) {
            
            con.email.adderror( 'Duplicate Contact Found.' );
        }
    }

}
    

}