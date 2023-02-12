public class MarketingCloudAPI {
    String ACCESS_TOKEN = 'accessToken'; 
    public static String makeSimpleJSONPostCall(String endPoint, String soapBody){
    Http h = new Http();
    HttpRequest r = new HttpRequest();
    r.setTimeout(60000);
    r.setEndpoint(endPoint);  
    r.setMethod('POST');
    r.setHeader('Content-type','application/json');    
    r.setBody(soapBody);    
    HttpResponse res = h.send(r);
    system.debug('endPoint'+endPoint);
    system.debug('soapBody'+soapBody);
    system.debug('r.getBody()'+ res.getBody());
    string access_token='access_token';
	string b = ((Map<String,String>) JSON.deserialize(res.getBody(), Map<String,String>.class)).get(access_token);
	System.debug(b);
    return r.getBody();
    
}
    

public  String getMarketingCloudOAuthToken(){
    string clientId='74chthlrikc39xrrymin6708';
    string clientSecret='BfSv5onJZXPytla1OP2jq1Kd';
    string grant_type='client_credentials';
    String ACCESS_TOKEN = 'access_token';
    String MARKETING_CLOUD_AUTH_URL = 'https://mc426ny-c2g8jmbrmvgwx0c5ynn0.auth.marketingcloudapis.com/v2/token';
    String responseBody = makeSimpleJSONPostCall(
        MARKETING_CLOUD_AUTH_URL,
        JSON.serialize( new Map<String, String>{
            'client_id' => clientId,
            'client_secret' => clientSecret,
            'grant_type'    => grant_type
        } )
    );
    return ((Map<String, String>) JSON.deserialize(responseBody, Map<String, String>.class)).get( ACCESS_TOKEN ); 
}
    
 public static void CreateDE(String endPoint, String soapBody){
    Http h = new Http();
    HttpRequest r = new HttpRequest();
    r.setTimeout(60000);
    r.setEndpoint(endPoint);  
    r.setMethod('POST');
    r.setHeader('SOAPAction','DoesNotMatter'); 
    r.setHeader('Accept','text/xml');  
    r.setHeader('Content-type','text/xml');    
    r.setHeader('charset','UTF-8'); 
    r.setBody(soapBody);    
    HttpResponse s = h.send(r);
    //return s.getBody();
}
    
    

}