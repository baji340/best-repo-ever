public class example14 {
    public list<example13> exam {set;get;}
    public string wname			{set;get;}
    public integer wno			{set;get;}
    
    public example14(){
        exam=new list<example13>();
    }
    
    public void add(){
        example13 aa= new example13();
        aa.name=wname;
        aa.no=wno;
        exam.add(aa);
    }
    public void del(){
        for(integer i=0;i<exam.size();i++)
        {
            exam.remove(i);
            i--;
        }
    }
}