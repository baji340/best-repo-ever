public class dependenpicklist {
    Public map<string,list<string>> options	{set;get;}
    public list<selectoption> cities		{set;get;}
    public list<selectoption> places		{set;get;}
    public string selected					{set;get;}
    
    Public dependenpicklist(){
        options = new map<string,list<string>>();
        cities=new list<selectoption>();
        places=new list<selectoption>();
        list<string> hplaces = new list<string>{'LB Nagar','Ameerpet'};
        list<string> Cplaces =new list<string>{'Annanagar','Tnagar'};
        selectoption n=new selectoption('-None-','-None-');
        cities.add(n);
        places.add(n);
        for(string s : options.keySet()){
            selectoption s1=new selectoption(s,s);
            cities.add(s1);
            
        }
    }

}