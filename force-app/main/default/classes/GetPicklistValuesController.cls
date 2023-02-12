public class GetPicklistValuesController {
    @AuraEnabled
    public static List <String> getPicklistValues(sObject obj, String fld) {
         
        List <String> pList = new list <String>();
         
        //Get the object type of the SObject.
        Schema.sObjectType objType = obj.getSObjectType();
 
        //Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
 
        //Get a map of fields for the SObject
        Map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap();
 
        //Get the list of picklist values for this field.
        List<Schema.PicklistEntry > values = fieldMap.get(fld).getDescribe().getPickListValues();
 
        //Add these values to the selectoption list.
        for (Schema.PicklistEntry a: values) {
            pList.add(a.getValue());
        }
        pList.sort();
        return pList;
    }
}