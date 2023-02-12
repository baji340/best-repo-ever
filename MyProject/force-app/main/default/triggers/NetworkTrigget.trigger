trigger NetworkTrigget on Network_Administrator__c (before delete) {
    for(Network_Administrator__c n:trigger.old){
        n.addError('cannot delete');
    }
}