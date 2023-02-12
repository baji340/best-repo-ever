public class Apex_Example2 {
    
    @auraEnabled
    public static string getname(string lastname,string firstname){
        string name=lastname+firstname;
        return name;
    }

}