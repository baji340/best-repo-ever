trigger casetrigger on Case (before insert,before update) {
    
    for(case c:trigger.new){
        Network_Management__mdt lis=[select Network_Representative_Name__c,Network_Representative_Phone__c from Network_Management__mdt where Network_Representative_Name__c=:c.Representative_Name__c ];
        if(c.Representative_Name__c==lis.Network_Representative_Name__c){
            c.Ph__c=lis.Network_Representative_Phone__c;
            //c.Network_rep_email__c=
        }
    }

}