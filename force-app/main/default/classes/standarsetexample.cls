public class standarsetexample {
    
    public apexpages.StandardSetController controller  {set;get;}
    public list<opportunity>getopty(){
        list<opportunity>opty=(list<opportunity>)controller.getRecords();
        return opty;
    }
    
    public standarsetexample(){
        list<opportunity> opty=[select id,name,stagename,amount from opportunity];
        controller=new apexpages.StandardSetController(opty);
        
    }
    

}