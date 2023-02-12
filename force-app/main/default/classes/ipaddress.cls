public class ipaddress {
    public string ipaddres	        {set;get;}
    public string result	{set;get;}
    public map<string,string> resmap	{set;get;}
    public void callme(){
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint('http://xml.utrace.de/?query='+ipaddres);
        request.setMethod('GET');
        HttpResponse response=p.send(request);
        result=response.getBody();
        resmap=new map<string,string>();
        dom.Document dm=new dom.Document();
        dm.load(result);
        dom.XmlNode root=dm.getrootelement();
        list<dom.XmlNode> child=root.getchildElements();
        list<dom.xmlnode> childs=child[0].getchildElements();
        for(dom.XmlNode n:childs){
            resmap.put(n.getName(), n.getText());
        }
        
    }

}