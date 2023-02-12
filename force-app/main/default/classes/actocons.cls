public class actocons
{
    public list<account> acct{set;get;}
    public actocons()
    {
        acct=[select id,name,(select id,lastname,email from contacts)from account limit 10 offset 4];
    }
}