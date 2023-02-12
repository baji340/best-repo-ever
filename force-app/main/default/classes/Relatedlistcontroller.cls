public class Relatedlistcontroller {
    
    @AuraEnabled
    public static Account fetchAccts(Id accountId) {
      return [SELECT Id,Name from Account WHERE Id = :accountId LIMIT 1];
    }    
    @AuraEnabled
    public static RelatedWrapper getrelatedlist(string recordId, string sObjectName, string strFields, string referenceField, string recordIdField, string hiddenName){
        system.debug('getRelatedRecords: ' + sObjectName + ' | ' + strFields + ' | ' + referenceField + ' | ' + recordIdField + ' | ' + hiddenName);
        RelatedWrapper relatedWrapper=new RelatedWrapper();
        try{
            list<string> fields=strFields.split(',');
            set<string> temp=new set<string>{'Id'};
                if(string.isNotBlank(recordIdField))
                    temp.add(recordIdField);
            
            relatedWrapper.sObjectLabel = Schema.getGlobalDescribe().get(sObjectName).getDescribe().getLabelPlural();
            Map<String, Schema.SObjectField> objFieldMap = Schema.getGlobalDescribe().get(sObjectName).getDescribe().fields.getMap();
			map<string,string> fieldsMap = new map<string,string>();
			map<string,string> dataTypeMap = new map<string,string>();
			string[] fieldsList = new string[]{};
                for( string fld : fields ){                
				if( objFieldMap.containsKey(fld) ){                    
					string apiName = objFieldMap.get(fld).getDescribe().getName();
					temp.add(apiName);
					fieldsList.add(apiName);
					fieldsMap.put( apiName, objFieldMap.get(fld).getDescribe().getLabel()+'--'+objFieldMap.get(fld).getDescribe().getType() );
					dataTypeMap.put( apiName, objFieldMap.get(fld).getDescribe().getType()+'' );
					
					if( objFieldMap.get(fld).getDescribe().getType()+'' == 'REFERENCE' ){
						temp.add( objFieldMap.get(fld).getDescribe().getRelationshipName()+'.Name' );
					}
				}
				else if( fld.indexOf('.') > 1 ){
					string[] relationFlds = fld.split('\\.');
					string fld1 = relationFlds[0];
					if( fld1.indexOf('__r') > 1 )
						fld1= fld1.replace('__r','__c');					
					else
						fld1 = fld1+'Id';
										
					if( objFieldMap.containsKey(fld1) ){
						string apiName = objFieldMap.get(fld1).getDescribe().getName();
						temp.add(fld);
						fieldsList.add(fld);
						List<Schema.SObjectType> listSobj = objFieldMap.get(fld1).getDescribe().getReferenceTo(); 
						string parentObject = listSobj[0].getDescribe().getName();
						fieldsMap.put( fld, Schema.getGlobalDescribe().get(parentObject).getDescribe().fields.getMap().get(relationFlds[1]).getDescribe().getLabel()  );
					}
				}
			}
			string qry = 'SELECT '+string.join(new list<string>(temp),',')+' FROM '+sObjectName + ' WHERE '+referenceField+' =: recordId ';            
            
            relatedWrapper.records = DataBase.query(qry);
            relatedWrapper.fieldsMap = fieldsMap;
            relatedWrapper.dataTypeMap = dataTypeMap; 
            relatedWrapper.fieldsList = new string[]{};
            relatedWrapper.fieldsList.addAll(fieldsList);  
        }
        catch( exception e ){
			relatedWrapper.errorMessage = e.getMessage();
		}
        return relatedWrapper;
    }
    public class RelatedWrapper{
        @AuraEnabled public map<string,string> fieldsMap;
    	@AuraEnabled public map<string,string> dataTypeMap;
    	@AuraEnabled public list<sObject> records;
    	@AuraEnabled public string sObjectLabel;
    	@AuraEnabled public string errorMessage;
    	@AuraEnabled public string[] fieldsList;
    }

}