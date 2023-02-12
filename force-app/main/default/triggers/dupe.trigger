trigger dupe on Account (before insert,before update) {
    list<string> names=new list<string>();
    set<string> newnames=new set<string>();
    for(account a:trigger.new ){
        names.add(a.name);
    }
    for(Account a:[select name from Account where name in :names]){
        newnames.add(a.name);
    }
    for(Account a : trigger.new){
        if(newnames.contains(a.name)){
            a.Name.addError('duplicates are not allowed');
        }
    }

}