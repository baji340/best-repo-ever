public with sharing class AccordionController {
   // test for pulling...... 
    public List < Account > listAccounts {get;set;}
    
    public AccordionController() {
        
        listAccounts = [ SELECT Id, Name, Industry, ( SELECT Id, FirstName, LastName, Email FROM Contacts ) FROM Account ORDER BY Name LIMIT 10 ];
        
    }
    
}
