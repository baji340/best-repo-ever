trigger t1 on Account (before insert) {
    for(Account a : Trigger.new){
        a.Name='test';
        a.Industry='Technology';
        a.Description='Account description';
    }

}