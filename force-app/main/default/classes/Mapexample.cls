public class Mapexample {
    public map<string,list<string>> options		{set;get;}
    public list<selectoption> cities			{set;get;}
    public list<selectoption> places			{set;get;}
    public string selected						{set;get;}
    
    Public Mapexample(){
        options=new map<string,list<string>>();
        cities=new list<selectoption>();
        places=new list<selectoption>();
        list<string> hplaces=new list<string>{'LB nagar','Ameerpet'};
        list<string> cplaces=new list<string>{'Tnagar','Anna nagar'};
                selectoption n=new selectoption('-None-','-None-');
        cities.add(n);
        places.add(n);
        options.put('HYD',hplaces);
        options.put('CHE',cplaces);
        for(string s : options.keySet()){
            selectoption op=new selectoption(s,s);
            cities.add(op);
        }
    }
    
    public void getdata(){
        places.clear();
        if(selected!='-None-'){
            list<string> placeoption=options.get(selected);
            for(string s: placeoption){
                selectoption op =new selectoption(s,s);
                places.add(op);
            }
        }else{
			selectoption n=new selectoption('-None-','-None-');
            places.add(n);
        }
    }

}