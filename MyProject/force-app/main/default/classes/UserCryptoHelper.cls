global with sharing class UserCryptoHelper {
    
    global virtual class UserEncryptionDecryptionException extends Exception {}

    global static String doEncrypt(String plainToken) 
    {
        String encryptedValue = System.EncodingUtil.base64Encode(System.Crypto.encryptWithManagedIV('AES256', getCryptoKey(null), System.Blob.valueOf(plainToken)));
        String hmacValue = System.EncodingUtil.base64Encode(System.Crypto.generateMac('HmacSHA256', System.Blob.valueOf(encryptedValue), getCryptoHmacKey(null)));
        return hmacValue + encryptedValue;
    }

    global static String doEncrypt(String plainToken, Id userId) 
    {
        if(userId == null)
        {
            return null;
        }

        String encryptedValue = System.EncodingUtil.base64Encode(System.Crypto.encryptWithManagedIV('AES256', getCryptoKey(userId), System.Blob.valueOf(plainToken)));
        String hmacValue = System.EncodingUtil.base64Encode(System.Crypto.generateMac('HmacSHA256', System.Blob.valueOf(encryptedValue), getCryptoHmacKey(userId)));
        return hmacValue + encryptedValue;
    }

    global static String doDecrypt(String encryptedToken) 
    {
        String hmacValue = encryptedToken.substring(0, 44);
        String encryptedValue = encryptedToken.substring(44);
        Boolean verified = System.Crypto.verifyHMac('HmacSHA256', System.Blob.valueOf(encryptedValue), getCryptoHmacKey(null), System.EncodingUtil.base64Decode(hmacValue));
        if(!verified)
        {
            throw new UserEncryptionDecryptionException('Could not verify decrypted payload.');
        }
        
        return System.Crypto.decryptWithManagedIV('AES256', getCryptoKey(null), System.EncodingUtil.base64Decode(encryptedValue)).toString();
        
    }
    
    @TestVisible
    private static blob getCryptoKey(Id userId)
    {
        try {
            
            User_Encryption_Settings__c ues = createOrUpdateUES(userId);

            return System.EncodingUtil.base64Decode(ues.Key__c);

        } catch(Exception e) {
            System.debug(e+'');
            return null;
        }

    }

    @TestVisible
    private static blob getCryptoHmacKey(Id userId)
    {
        try {
            
            User_Encryption_Settings__c ues = createOrUpdateUES(userId);
            
            return System.EncodingUtil.base64Decode(ues.Hmac_Key__c);

        } catch(Exception e) {
            System.debug(e+'');
            return null;
        }

    }

    private static User_Encryption_Settings__c createOrUpdateUES(Id userId)
    {
        userId = (userId != null) ? userId : System.UserInfo.getUserId();
        User_Encryption_Settings__c ues = User_Encryption_Settings__c.getValues(userId);
        if(ues == null)
        {
            ues = new User_Encryption_Settings__c();
            ues.Name__c = userId;
            ues.Key__c = System.EncodingUtil.base64Encode(System.Crypto.generateAesKey(256));
            ues.Hmac_Key__c = System.EncodingUtil.base64Encode(System.Crypto.generateAesKey(256));
            insert ues;
        }
        else 
        {
            ues.Key__c = (ues != null && (ues.Key__c == null || String.isEmpty(ues.Key__c.trim()))) ? System.EncodingUtil.base64Encode(System.Crypto.generateAesKey(256)) : ues.Key__c;
            ues.Hmac_Key__c = (ues != null && (ues.Hmac_Key__c == null || String.isEmpty(ues.Hmac_Key__c.trim()))) ? System.EncodingUtil.base64Encode(System.Crypto.generateAesKey(256)) : ues.Hmac_Key__c;
            update ues;
        }
        return ues;
    }

}