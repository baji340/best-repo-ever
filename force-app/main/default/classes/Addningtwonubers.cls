public with sharing class Addningtwonubers {
    public Addningtwonubers() {

    }
    @AuraEnabled
    public static integer addition(Integer fnumber,integer snumber){
        return (fnumber+snumber);
    }
 
}