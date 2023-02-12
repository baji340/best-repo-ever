public with sharing class mapkeyvalueapexcontroller {
    @AuraEnabled(cacheable=true)
    public static map<string,List<string>> methodName(){
        map<string,List<string>> mapkeyvaluestore=new map<string,List<string>>();
        mapkeyvaluestore.put('key1',new List<string>{'STORE1','STORE6'} );
        mapkeyvaluestore.put('key2',new List<string>{'STORE2','STORE7'});
        mapkeyvaluestore.put('key3',new List<string>{'STORE3','STORE8'});
        mapkeyvaluestore.put('key4',new List<string>{'STORE4','STORE9'});
        mapkeyvaluestore.put('key5',new List<string>{'STORE5','STORE10'});
        return mapkeyvaluestore;
    }
    public mapkeyvalueapexcontroller() {

    }
}