public class phonechange {
                    list<id> ids=new list<id>();

    public static void accountphonechange(map<id,Account> oldva,map<id,account>newva){
	list<id> ids=new list<id>();

        for(id i:oldva.keyset()){
            account a=oldva.get(i);
            account b=newva.get(i);
            if(a.Phone!=b.Phone){
                ids.add(a.id);
            }
        }
        for(contact c:[select id,lastname from contact where accountid in :ids]){
            account a=oldva.get(c.AccountId);
            account b=newva.get(c.AccountId); 
            c.OtherPhone=a.Phone;
            c.Phone=b.Phone;
            
        }
        
    }

}