public class AddContacts {
        public Account accounts;
        public Contact del;
        public List < Contact > addContactList {get;set;}
        public List < Contact > delContactList {get;set;}
        public List < Contact > contactList {get;set;}
        public Integer totalCount {get;set;}
        public Integer rowIndex {get;set;}
        public List < Contact > delContacts {get;set;}

        public AddContacts(ApexPages.StandardController controller) {
                accounts = (Account) controller.getRecord();
                contactList = [Select id, firstName, LastName from Contact where AccountId = : accounts.Id];
                totalCount = contactList.size();
                delContactList = new List < Contact > ();
                delContacts = new List < Contact > ();
        }

        public void addRow() {
                addContactList = new List < Contact > ();
                contactList.add(new Contact(AccountId = accounts.Id));
        }

        public PageReference save() {
                upsert contactList;
                delete delContactList;
                //return (new ApexPages.StandardController(accounts)).view();
                PageReference pageRef = new PageReference('/apex/addcontactpage');
                pageRef.getParameters().put('id',accounts.Id);
                return pageRef;
        }
        public void deleteRow() {
                rowIndex = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndex'));
                del = contactList.remove(rowIndex);
                delContactList.add(del);
        }
}