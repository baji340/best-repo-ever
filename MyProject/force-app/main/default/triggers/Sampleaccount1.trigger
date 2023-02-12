trigger Sampleaccount1 on Account (before delete) {
for(account a:trigger.old){

    a.addError('conont delete');
    system.debug('-----------------');
    system.debug(trigger.old);
}
}