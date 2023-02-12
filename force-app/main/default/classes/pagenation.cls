public class pagenation {
    
    public apexpages.StandardSetController controller {set;get;}
    public list<opportunity>getopty(){
        list<opportunity> opty=(list<opportunity>)controller.getRecords();
        return opty;
    }
    public pagenation(){
        list<opportunity> opty=[select id,name from opportunity];
        controller=new apexpages.StandardSetController(opty);
        controller.setPageSize(5);
    }
    

}