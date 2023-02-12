public class Sample { 
    public List<Account> accList { get; set; }
    public List<Contact> contactList { get; set; }
    public Map<Id, List<contact>> accIdcontactListMap { get; set; }
    Set<Id> accIds = new Set<Id>();
    Map<Id, Account> accMap = new Map<Id, Account>();
    
    public List<MemberWrapper> memberWrapperList { get; set; }

    public Sample() {   
        accList = [SELECT id, Name FROM Account];
        accIdcontactListMap = new Map<Id, List<contact>>();
        memberWrapperList = new List<MemberWrapper>();
        if(accList .size() > 0) {
            for(Account acc : accList ) {
                accIds.add(acc.Id);
                accMap.put(acc.Id, acc);
            }
            contactList = [SELECT Name, Accountid, (SELECT id, CaseNumber FROM Cases) From Contact WHERE Accountid IN : accIds];
            system.debug('Interest List is ' + contactList);
        }
        if(contactList.size() > 0) {
            for(contact intrst : contactList) {
                if(!accIdcontactListMap.containsKey(intrst.Accountid)){
                    accIdcontactListMap.put(intrst.Accountid, new List<Contact>());
                }
                accIdcontactListMap.get(intrst.Accountid).add(intrst);
            }
            for(Id interestId : accIdcontactListMap.keySet()) {
                memberWrapperList.add(new MemberWrapper(accMap.get(interestId), accIdcontactListMap.get(interestId)));
            }
        }
    } 
    
    public class MemberWrapper {
        public Account member { get; set; }
        public List<Contact> contactlist1{ get; set; }
        
        public MemberWrapper(Account member, List<contact> contactlist1){
            this.member = member;
            this.contactlist1= contactlist1;
        }
    }
}