global class AccountCorporateAccountChildCountBatched implements Database.Batchable<sObject> {
	public String query;
	public String email;
	public Id toUserId;
	public Id fromUserId;
	
	global database.querylocator start(Database.BatchableContext BC){ return Database.getQueryLocator(query); }
		
	global void execute(Database.BatchableContext BC, List<sObject> scope){
		
		MAP<Id, integer> childCount = new MAP<Id, integer>();
		set<Id> corpAcctIds = new set<Id>();
		MAP<Id, Id> grandParentId = new MAP<Id, Id>();
		LIST<Account> corpAccounts = new LIST<Account>();
		
		for(sObject s : scope){ Account accts = (Account)s;	CorpAcctIds.add(accts.Id); }	
		
		for(Account thisChild: [select Id, ParentId from Account where ParentId IN: corpAcctIds 
								]){
			if(childCount.get(thisChild.ParentId)==null) childCount.put(thisChild.ParentId, 0);
			childCount.put(thisChild.ParentId, childCount.get(thisChild.ParentId)+1);
			grandParentId.put(thisChild.Id, thisChild.ParentId);
		}
		for(Account thisGrandChild: [select Id, ParentId from Account where ParentId IN: grandParentId.keyset()]){
			if(childCount.get(grandParentId.get(thisGrandChild.ParentId))==null) childCount.put(grandParentId.get(thisGrandChild.ParentId), 0);
			childCount.put(grandParentId.get(thisGrandChild.ParentId), childCount.get(grandParentId.get(thisGrandChild.ParentId))+1);
		}
		for(sObject s: scope){
			Account acct = (Account)s;
			corpAccounts.add(acct); 
		} 
		try{ update corpAccounts; }catch(Exception Ex){
			
		}
	}
	global void finish(Database.BatchableContext BC){
	/*	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		mail.setToAddresses(new String[] {email});
		mail.setReplyTo(email);
		mail.setSenderDisplayName('Batch Processing');
		mail.setSubject('Update Corporate Child Count Batch Process Completed');
		mail.setPlainTextBody('Update Corporate Child Count Batch Process has completed');
		SendAnEmail.notATestEmail(new Messaging.SingleEmailMessage[] { mail }); */
         String formatted = Datetime.now().format();
        AsyncApexJob mainjob =[Select Id,status,numberoferrors,jobitemsprocessed,totaljobitems from AsyncApexJob WHERE Id =:BC.getJobId()];              
        if(mainjob.NumberOfErrors > 0){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[]{'gregory.beris@optum.com','divya_todupunuri@optum.com'});
            mail.setReplyTo('gregory.beris@optum.com');
            mail.setSenderDisplayName('Batch Processing');
            mail.setSubject('Update Corporate Child Count Batch Process Failed');
            mail.setPlainTextBody('Update Corporate Child Count Batch Process has Failed at ' +formatted+ 'with ' +mainjob.NumberOfErrors+' '+'error(s).');
            //Sendmail.notATestEmail(new Messaging.SingleEmailMessage[] { mail });
            
        }
    
	}
}