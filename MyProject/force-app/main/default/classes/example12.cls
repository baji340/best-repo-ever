public class example12 {
    public list<Account> acc	{set;get;}
    
    public example12(){
        acc=[select id,name from Account];
    }

}