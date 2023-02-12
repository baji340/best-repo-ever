public class Customdataclass {
    
    public list<network__mdt> selectedname	{get;set;}
    public List<Selectoption> lstnamesel	{get;set;}
     Public List<Selectoption> getselectednamefields(){
            List<Selectoption> lstnamesel = new List<selectoption>();
            lstnamesel.add(new selectOption('', '- None -'));
            for(network__mdt nt :[SELECT name__c FROM network__mdt]){
            lstnamesel.add(new selectoption(nt.name__c,nt.name__c));
            }
            return lstnamesel; 
        }
}