public without sharing class CasehelperWS{
    
    public static string doUpdate(Case co2)
    {
        try {
            update co2;
            return 'success';
        } catch (Exception e) {
            return 'Error: ' + e;
        }
    }

    public static List<Case> getCO2List(String recordId, String createdDate)
    {
        DateTime dt = Datetime.valueOfGMT(createdDate.replace('T',' '));
        return [SELECT Id FROM Case WHERE Id = :recordId AND CreatedDate = :dt];
    }

    public static String getCreatedDate(string recordId)
    {
        return [SELECT CreatedDate FROM case WHERE Id =:recordId LIMIT 1].CreatedDate + '';
    }

    public static Boolean verifyRecord(String recordId, String createdDate)
    {
        DateTime dt = Datetime.valueOfGMT(createdDate.replace('T',' '));
        return [SELECT COUNT() FROM case WHERE Id =: recordId AND CreatedDate = :dt AND CreatedById = :System.UserInfo.getUserId()] > 0;
    } 
}