global class batchwebexample implements database.Batchable<sobject>,Database.Allowscallouts{
    
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select Name,Place__c,Zipcode__c from employee__c');
    }
    global void execute(database.BatchableContext bc,list<Employee__c> scope){
        for(Employee__c e:scope){
            Http p=new Http();
            Httprequest request=new Httprequest();
            request.setEndpoint('https://api.postalpincode.in/postoffice/'+e.place__c);
            request.setMethod('GET');
            HttpResponse response=p.send(request);
            string jsonbody=response.getBody();
            system.JSONParser jp=Json.createParser(jsonbody);
            string code;
            while(jp.nextToken()!=null){
                if(jp.getText()=='Pincode'){
                    jp.nextToken();
                    code=jp.getText();
                    
                }
            }
            e.Zipcode__c=code;
            
        }
        update scope;
    }
    global void finish(database.BatchableContext bc){
        
    }

}