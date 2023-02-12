public class AccountWPController {
    public List<AccountWrapper> accsw = new List<AccountWrapper>();
   
    public class AccountWrapper{
        public Account acc{get;set;}
        public Boolean isSelected{get;set;}
       
        public AccountWrapper(Account a){
            acc = a;
            isSelected = false;
        }
    }
   
    //limited display list
    public List<AccountWrapper> accstoshow;
   
    //Navigation Variables
    Integer counter = 0;    // To track number of records parsed
    Integer limitSize = 20; // Number of records to be displayed
    Integer totalSize = 0;  // To store the total number of records available
   
    //Our collection of the class/wrapper objects AccountWrapper
    public List<AccountWrapper> AccountList {get; set;}
   
   
    public AccountWPController(){
        accstoshow = new List<AccountWrapper>();
        List<Account> allaccs = [select ID, Name from Account ORDER BY Name LIMIT 999];
        for(Account a : allaccs){
            accsw.add(new AccountWrapper(a));
        }
        totalSize = accsw.size();
       
        if((counter+limitSize) <= totalSize){
            for(Integer i = 0; i<limitSize; i++)
                accstoshow.add(accsw.get(i));
           
        }
        else{
            for(Integer i=0;i<totalSize;i++)
                accstoshow.add(accsw.get(i));
           
        }
    }
   
   
    //Navigation methods
   
    public void beginning(){
       
        accstoshow.clear();
        counter=0;
        if((counter + limitSize) <= totalSize){

          
            for(Integer i=0;i<limitSize;i++){
                accstoshow.add(accsw.get(i));
            }  
           
        } else{
           
            for(Integer i=0;i<totalSize;i++){
                accstoshow.add(accsw.get(i));
            }      
           
        }
       
    }
   
    public void next(){
       
        accstoshow.clear();
        counter=counter+limitSize;
     
       if((counter+limitSize) <= totalSize){
            for(Integer i=counter-1;i<(counter+limitSize);i++){
                accstoshow.add(accsw.get(i));
            }

       } else{
            for(Integer i=counter;i<totalSize;i++){
                accstoshow.add(accsw.get(i));
            }
        }
    }
   
    public void previous(){
       
        accstoshow.clear();
       
        counter=counter-limitSize;      
       
        for(Integer i=counter;i<(counter+limitSize); i++){
            accstoshow.add(accsw.get(i));
        }
    }
   
    public void last (){
       
        accstoshow.clear();
       
        if(math.mod(totalSize , limitSize) == 0){
            counter = limitSize * ((totalSize/limitSize)-1);
        } else if (math.mod(totalSize , limitSize) != 0){
            counter = limitSize * ((totalSize/limitSize));
        }
       
        for(Integer i=counter-1;i<totalSize-1;i++){
            accstoshow.add(accsw.get(i));
        }
       
    }
   
    public Boolean getDisableNext(){
       
        if((counter + limitSize) >= totalSize )
            return true ;
        else
            return false ;
    }
   
    public Boolean getDisablePrevious(){
       
        if(counter == 0)
            return true ;
        else
            return false ;
    }
   
    public List <AccountWrapper> getAccs(){
        return accstoshow;
    }
  
   public PageReference processSelected() {
        System.debug('entering processing ..');
        //We create a new list of Accounts that wil be populated only with Account if they are selected
        List<Account> selectedAccounts = new List<Account>();
       
        //We will cycle through our list of AccountWrapper and will check to see if the selected property is set to true, if it is we add the Account to the selectedAccounts list
        for(AccountWrapper ac: getAccounts()) {
            if(ac.isSelected == true) {
                System.debug('process going on');

               selectedAccounts.add(ac.acc);
            }
        }
      
        // Now we have our list of selected account and can perform any type of logic we want, sending emails, updating a field on the Account, etc
        System.debug('Results');
        for(Account ac: selectedAccounts) {
            System.debug(ac);
        }
        AccountList=null; // we need this line if we performed a write operation  because getAccounts gets a fresh list now
        return null;

  }
   
   
    //This method uses a simple SOQL query to return a List of Account
    public List<AccountWrapper> getAccounts() {
        if(AccountList == null) {
            AccountList = accsw;
        }
        return AccountList;
    }
}