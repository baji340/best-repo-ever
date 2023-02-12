public class Dml1 {
    public Account acc	{set;get;}
    public Contact con	{set;get;}
    public dml1(){
        acc=new Account();
        con=new Contact();
    }
    public pagereference create(){
        insert acc;
        con.accountid=acc.id;
        insert con;
       pagereference p=new pagereference('/'+acc.id);
        return p;
    }
}