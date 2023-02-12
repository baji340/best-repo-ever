trigger Accountwith2con on Account (before delete) {
    
    public set<id> ids=new set<id>();
    for(Account a : Trigger.old){
        ids.add(a.id);
    }
    map<id,account> accounts = new map<id,account>([select id, name, (select lastname, firstname from contacts) from account where id in : ids]);
    for(Account a : trigger.old){
        if(accounts.get(a.Id).contacts.size()>2){
            a.adderror('cannot deleted');
        }
    }
}