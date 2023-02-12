trigger errordelete on Account (before delete) {

set<id> acctid = new set<id>();

for(account a : trigger.old){

acctid.add(a.id);

}

map<id,account> accounts = new map<id,account>([select id, name, (select lastname, firstname from contacts) from account where id in : acctid]);

for(account acc : trigger.old){

    if(accounts.get(acc.Id).contacts.size()>=2){
    acc.addError('cannot delete');

}

}

}