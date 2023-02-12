trigger Productinfo on Productinfo__c (after insert) {
	set<id> keys=trigger.newmap.keyset();
    Futureex.callme(keys);
}