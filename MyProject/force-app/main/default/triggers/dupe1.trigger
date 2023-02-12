trigger dupe1 on Account (before insert) {
    set<string> accountnames=new set<string>();
    set<string> accountold=new set<String>();
    for(Account a: trigger.new){
        accountnames.add(a.name);
    }
    
    for(Account a1:[select name from account where name in :accountnames]){
        accountold.add(a1.name);
        
    }
    for(Account a:trigger.new){
        if(accountold.contains(a.Name)){
            system.debug('duplicate accounts');
        }
        
    }
        

}