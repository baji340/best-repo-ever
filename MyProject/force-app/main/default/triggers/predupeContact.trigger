trigger predupeContact on Contact (before insert,before update) {
    string user1=[select name from Profile where id =:Userinfo.getProfileId()].name;
    if(user1!='System Administrator'){
	prevDuplicateContact.onBefore(trigger.new);
    }
}