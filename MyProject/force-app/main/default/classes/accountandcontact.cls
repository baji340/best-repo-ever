public class accountandcontact {
    public list<Wrapper1> wrap {set;get;}
    public Wrapper1 wrap1		{set;get;}
    public list <Account> acc1	{set;get;}
    public string name 			{set;get;}
    public string industry		{set;get;}
    public list<string> indu	{set;get;}
    Public accountandcontact(){
        wrap=new list<wrapper1>();
        acc1=[select id,name,industry from Account];
        for(Account a : acc1){
            wrap1=new Wrapper1();
            wrap1.acc=a;
            wrap1.flag=false;
            wrap.add(wrap1);

        }
            
        }
 public pagereference del(){
         list<Account> accountlist =new list<Account> ();
        for(wrapper1 w : wrap){
            if(w.flag == true){
                accountlist.add(w.acc);
            }
        }
       delete accountlist;
     pagereference p = new pagereference('/apex/accountandcontactpage');
     p.setRedirect(true);
     return p;
    }
    
    Public pagereference Change(){
        list<Account> accountlist =new list<Account> ();
        for(wrapper1 w : wrap){
            if(w.flag == true){
                w.acc.Industry=industry;
                accountlist.add(w.acc);
    }

}
     update accountlist;
     pagereference p = new pagereference('/apex/accountandcontactpage');
     p.setRedirect(true);
     return p;
    }
    
    Public pagereference add(){
        list<Account> accountlist =new list<Account> ();
        for(wrapper1 w : wrap){
            w.acc=new Account();
            w.acc.name=name;
            w.acc.industry=industry;
        	w.flag=false;
            accountlist.add(w.acc);
        }
        insert accountlist;
     pagereference p = new pagereference('/apex/accountandcontactpage');
     p.setRedirect(true);
     return p;
        
    }
}