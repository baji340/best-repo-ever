public without sharing class ContentVersionTriggerHandlerWS {
    
    public static final Long validTimestampMinutes = 10;
    
    public static void decryptTokens(List<ContentVersion> cvList)
    {
        for(ContentVersion cv : cvList)
        {
            System.debug('file info: ' + cv);
            if(cv.Encrypted_Token_fileupload__c  != null)
            {
            
                String decryptedToken = UserCryptoHelper.doDecrypt(System.EncodingUtil.urlDecode(cv.Encrypted_Token_fileupload__c ,'UTF-8'));
                String decryptedRecordId = decryptedToken.split('\\|')[0];
                String createdDate = decryptedToken.split('\\|')[1];
                String timestamp = decryptedToken.split('\\|')[2];
                
                if(!isTimestampValid(System.Long.valueOf(timestamp)))
                {
                    throw new CaseController1.co2Exception('Token has Expired!');
                }
                
                if(!CasehelperWS.verifyRecord(decryptedRecordId,createdDate))
                {
                    throw new CaseController1.co2Exception('Record Not Verified');
                }
                
                cv.Encrypted_Token_fileupload__c  = decryptedRecordId;
                
            }
        }
    }
    
    public static void createContentDocumentLinks(List<ContentVersion> cvList)
    {
        List<ContentDocumentLink> cdlList = new List<ContentDocumentLink>();
        
        for(ContentVersion cv : cvList)
        {
            System.debug('file info: ' + cv);
            if(cv.Encrypted_Token_fileupload__c  != null)
            {
            
                ContentDocumentLink cdl = new ContentDocumentLink();
                cdl.ContentDocumentId = cv.ContentDocumentId;
                cdl.LinkedEntityId = cv.Encrypted_Token_fileupload__c ;
                cdl.ShareType = 'V'; /* V=Viewer, I=Inferred from related record, C=Collaborator (doesn't work) */
                cdl.Visibility = 'AllUsers'; /* AllUser = The file can be accessed by internal, community, and guest users who can access the record. InternalUsers = The file is only accessible to internal users who can access the record. */
                
                cdlList.add(cdl);
                
            }
        }
        
        insert cdlList;
        
    }
    
    
    private static Boolean isTimestampValid(Long timestamp)
    {
        return ((System.now().getTime() - timestamp) / 60000) <= validTimestampMinutes;
    }

}