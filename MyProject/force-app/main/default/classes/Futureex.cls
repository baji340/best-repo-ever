public class Futureex {
	@Future(callout=true)
    public static void callme(set<id> keys){
    	Http p = New Http();
    	HttpRequest request=new HttpRequest();
    	string url='http://api.currencylayer.com/live?access_key=99bf70dfa94a27c75358ec4f7e3c860c&currencies=INR&source=USD&format=1';
    	request.setEndpoint(url);
    	request.setMethod('GET');
    	HttpResponse response=p.send(request);
    	string jsonbody=response.getBody();
    	system.JSONParser jp=Json.createparser(jsonbody);
    	decimal dollor=0;
    while(jp.nextToken()!=null){
        if(jp.getText()=='USDINR'){
            jp.nextToken();
            dollor=(decimal)jp.getDecimalValue();
        }
    }
        list<productinfo__c> products=[select id,Price__c,Price_in_INR__c from productinfo__c where id in :keys];
        for(Productinfo__c c:products){
            c.Price_in_INR__c=c.Price__c*dollor;
        }
        update products;
    }
}