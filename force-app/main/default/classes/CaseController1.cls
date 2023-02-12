public with sharing class CaseController1{
    
    public static final Long validTimestampMinutes = 10;
    
    
    public static String getCO2(String encryptedToken)
    {
        Case co2 = new case();
        if(System.UserInfo.getUserType() == 'Guest' && encryptedToken != null)
        {
            String decryptedToken = UserCryptoHelper.doDecrypt(System.EncodingUtil.urlDecode(encryptedToken,'UTF-8'));
            String decryptedRecordId = decryptedToken.split('\\|')[0];
            String createdDate = decryptedToken.split('\\|')[1];
            String timestamp = decryptedToken.split('\\|')[2];
            if(!isTimestampValid(System.Long.valueOf(timestamp)))
            {
                throw new CaseController1.co2Exception('Token has Expired!');
            }
            List<case> co2List = new List<Case>();
            
            co2List = CasehelperWS.getCO2List(decryptedRecordId, createdDate);
            

            if(co2List.size() > 0)
            {
                co2 = co2List[0];
                return System.JSON.serialize(secureRecord(co2,encryptedToken));
            }
        }
        return System.JSON.serialize(co2);
    }

    
    public static String createCO2(case co2, Boolean doUpdate)
    {
        Set<String> cleanFieldSet = new Set<String>{'Name'};
        co2 = (Case) getCleanSObject(co2, 'Case', cleanFieldSet);
        
        insert co2;
        String createdDate = CasehelperWS.getCreatedDate(co2.Id);
        if(System.UserInfo.getUserType() == 'Guest' && co2.Id != null)
        {
            if(doUpdate)
            {
                co2 = doGuestPostCreateUpdates(co2,createdDate);
            }

            return System.JSON.serialize(secureRecord(co2,UserCryptoHelper.doEncrypt(co2.Id+'|'+createdDate+'|'+System.DateTime.now().getTime())));
        }
        return System.JSON.serialize(co2);
    }

    
    public static String updateCO2(Case co2, String encryptedToken)
    {
        Set<String> cleanFieldSet = new Set<String>{'Name'};
        co2 = (Case) getCleanSObject(co2, 'Case', cleanFieldSet);
        
        co2.SuppliedEmail = 'updated from apex controller';
        
        if(System.UserInfo.getUserType() == 'Guest' && encryptedToken != null)
        {
            String decryptedToken =UserCryptoHelper.doDecrypt(System.EncodingUtil.urlDecode(encryptedToken,'UTF-8'));
            String decryptedRecordId = decryptedToken.split('\\|')[0];
            String createdDate = decryptedToken.split('\\|')[1];
            co2.Id = decryptedRecordId;
            String timestamp = decryptedToken.split('\\|')[2];
            if(!isTimestampValid(System.Long.valueOf(timestamp)))
            {
                throw new CaseController1.co2Exception('Token has Expired!');
            }
            //check if record was created by guest user as best practice
            if(!CasehelperWS.verifyRecord(co2.Id,createdDate))
            {
                throw new co2Exception('Record Not Verified');
            }
            //update co2; //Fails with new Guest secure record access setting enabled
            String result = CasehelperWS.doUpdate(co2);
            if(result == 'success')
            {
                return System.JSON.serialize(secureRecord(co2,encryptedToken));
            }
            else 
            {
                throw new co2Exception(result);
            }

        }
        return System.JSON.serialize(co2);
    }


    private static Map<String,Object> secureRecord(Case co2, String encryptedToken)
    {
        Map<String,Object> co2ObjectMap = new Map<String,Object>();
        co2ObjectMap = (Map<String,Object>)System.JSON.deserializeUntyped(System.JSON.serialize(co2));
        co2ObjectMap.put('Id',System.EncodingUtil.urlEncode(encryptedToken,'UTF-8'));
        co2ObjectMap.put('attributes',null);
        co2ObjectMap.put('userId',System.UserInfo.getUserId());
        return co2ObjectMap;
    }

    private static Case doGuestPostCreateUpdates(Case co2, String createdDate)
    {
        if(System.UserInfo.getUserType() == 'Guest')
        {
            String co2Id = co2.Id;
            co2.Id = null;
            String encryptedCo2Id = System.EncodingUtil.urlEncode(UserCryptoHelper.doEncrypt(co2Id+'|'+createdDate+'|'+System.DateTime.now().getTime()), 'UTF-8');
            co2 = (case)JSON.deserialize(updateCO2(co2,encryptedCo2Id), case.class);
            co2.Id = co2Id;
            return co2;
        }
        throw new CaseController1.co2Exception('Not a Guest User');
    }
    
    private static Boolean isTimestampValid(Long timestamp)
    {
        return ((System.now().getTime() - timestamp) / 60000) < validTimestampMinutes;
    }
    
    private static SObject getCleanSObject(SObject so, String sobjectName, Set<String> fieldsSet)
    {
        SObject newSO = System.Schema.getGlobalDescribe().get(sobjectName).newSObject();
        for(String field : fieldsSet)
        {
            if(so.get(field) != null)
            {
                newSO.put(field,so.get(field));
            }
        }
        return newSO;
    }

public class co2Exception extends Exception {}

}