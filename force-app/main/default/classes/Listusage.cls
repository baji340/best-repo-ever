public class Listusage {
    public string name{set;get;}
     public string phone{set;get;}
    Public list<Account> acclist = New list<Account>();
    public  void savedata(){
        
        Account a= new account();
        a.Name = name;
        a.Phone=phone;
          acclist.add(a);  
        
       insert acclist; 
    }

                
    /*public void resetdata(){
        name='';
        phone='';
        
    }*/
    
}