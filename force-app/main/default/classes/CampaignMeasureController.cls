public class CampaignMeasureController {  
    @AuraEnabled
    public static Measure__c getmesuredetails(String parentId){
        Id myId = UserInfo.getUserId();
        System.debug('myId+++++++++++'+parentId);
        List<Measure__c> mesurelist = new List<Measure__c>();
        mesurelist = [Select Id, Name, Domain__c From Measure__c where id=:parentId];
        if(mesurelist.size() > 0)
        {
            return mesurelist[0];
        }
        else 
            return null;
        
    }
    @AuraEnabled
    public static resultWrapper listAllFields(string mesureid){
        string measurename=[select id,name from Measure__c where id=:mesureid].name;
        system.debug('measurename'+measurename);
        Custom_Criteria__mdt tableDetails = [SELECT MasterLabel,Measure__c,Object_Name__c,Field_Names__c,
                                                  Row_Count__c
                                                  FROM Custom_Criteria__mdt where Measure__c=:measurename];
        system.debug('tableDetails '+tableDetails);
        String objectName = tableDetails.Object_Name__c;
        String columnNames = tableDetails.Field_Names__c;
        List<fieldDataWrapper> wrapperList =  new List<fieldDataWrapper>(); 
        List<fieldDataWrapper> fieldWrapperList =  new List<fieldDataWrapper>();
        SObjectType sObjectName = Schema.getGlobalDescribe().get(objectName);
        Map<String,Schema.SObjectField> mfields = sObjectName.getDescribe().fields.getMap();
        List<Schema.SObjectField> mFieldList = new List<Schema.SObjectField>();
        for(String s:ColumnNames.split('\\,')){
            mFieldList.add(mfields.get(s));			    
        }
        system.debug('mFieldList '+mFieldList);
        
        For(Schema.SObjectField field : mFieldList){
            fieldDataWrapper wrapper = new fieldDataWrapper();
            wrapper.label = field.getDescribe().getLabel();
            wrapper.fieldName = field.getDescribe().getName();
            wrapper.type = String.valueOf(field.getDescribe().getType());            
            wrapperList.add(wrapper);
        }
        system.debug('wrapperList '+wrapperList);
        resultWrapper result = new resultWrapper(objectName, columnNames, wrapperList, 
                                                 tableDetails.Row_Count__c);
        system.debug('result '+result);
        return result;
    }
    
    public class resultWrapper{
        @AuraEnabled	public string objectType {get; set;}
        @AuraEnabled	public string columnName {get; set;}
        @AuraEnabled	public List<fieldDataWrapper> fieldDetails {get; set;}
        @AuraEnabled	public Decimal rowCount {get;set;}
        //@AuraEnabled	public Boolean viewMoreOption {get;set;}
        public resultWrapper(String obj, String columns, List<fieldDataWrapper> fields, Decimal noRows){
            objectType = obj;
            columnName = columns;
            fieldDetails = fields;
            rowCount = noRows;
            //viewMoreOption = enableViewMore;
        }
    }
    
    public class fieldDataWrapper{
        @AuraEnabled	public String label { get; set; }
        @AuraEnabled	public String fieldName { get; set; }
        @AuraEnabled	public String type { get; set; }
    }
    

    @AuraEnabled
    public static list<string> getstate(string campaignid){
        string states= [select id,State__c from Campaign where id=:campaignid].state__c;
        list<string>statelist=new list<string>();
        for(string s:states.split('\\;')){
            statelist.add(s);
        }
        return statelist;
    }
}