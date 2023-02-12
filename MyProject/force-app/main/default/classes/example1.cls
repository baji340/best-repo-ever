public class example1 {
    public list<Account> acc {set;get;}
    public example1(){
        acc=new list<Account>();
        Account a = new Account();
        a.Name='test1';
       account b= new Account();
        b.name='test2';
        acc.add(a);
        acc.add(b);
        system.debug(acc);
    }
   
}