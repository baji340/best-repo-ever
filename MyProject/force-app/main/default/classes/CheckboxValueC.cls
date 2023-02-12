public class CheckboxValueC {

    public Boolean isChecked{ get; set; }
    
    public void click(){
        if(isChecked==true){
            System.debug('I am true');
        }
        else{
            System.debug('I am false');
        }
    }
}