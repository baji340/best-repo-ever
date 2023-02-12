trigger Opptrigger1 on Opportunity (before insert) {
    list<opportunity> opp=new list<opportunity>();
    for(opportunity op:Trigger.New){
        list<network__mdt> netlist=[select name__c from network__mdt];
        	network__mdt m=netlist[0];
           op.Network_Administrator_Name__c=m.name__c; 
            
        //opp.add(op);
       
    }
    //update opp;
}