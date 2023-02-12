public without sharing class ContentVersionTriggerHandler {
    
    public static void handleBeforeInsert(List<ContentVersion> newList)
    {
        if(System.UserInfo.getUserType() == 'Guest')
        {
            ContentVersionTriggerHandlerWS.decryptTokens(newList);
        }
    }
    
    public static void handleAfterInsert(Map<Id,ContentVersion> newMap)
    {
        List<ContentVersion> cvList = new List<ContentVersion>();
        
        if(System.UserInfo.getUserType() == 'Guest')
        {
            ContentVersionTriggerHandlerWS.createContentDocumentLinks(newMap.values());
        }
    }
    
}