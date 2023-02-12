public class Apex_Example3 {
    
    @auraEnabled
    public static decimal Intrest(integer Amount,integer Rate,integer year){
        decimal Intrest=(Amount*Rate*year)/100;
        return Intrest;
    }

}