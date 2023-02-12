public class Soqlex1 {
    public list<selectoption> options	{set;get;}
    public list<Account> acc				{set;get;}
    public string selected					{set;get;}
    public Soqlex1(){
        acc=[select name,industry from Account];
        options=new list<selectoption>();
        list<integer> rows=new list<integer>{1,5,10,20};
            for(integer i=0;i<rows.size();i++){
                selectoption s=new selectoption(string.valueOf(rows[i]),string.valueOf(rows[i]));
                options.add(s);
            }
    }
    
    public void reset(){
        integer size=integer.valueOf(selected);
        acc=[select name,industry from account limit:size];
    }

}