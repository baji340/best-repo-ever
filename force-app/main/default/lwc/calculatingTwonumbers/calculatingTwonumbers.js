import { LightningElement ,track,api} from 'lwc';
import getsum from '@salesforce/apex/Acc.getsum';
export default class CalculatingTwonumbers extends LightningElement {
    @track firstnumber;
    @track secondnumber;
    @track sum;
    @track errors;
    @api title;
    @api gretings;
    handleclick(){
        getsum({firstnumber:this.firstnumber,secondnumber:this.secondnumber})
            .then(result=>{
                this.sum=result;
                console.log('result'+result);
            })
            .catch(error=>{
                this.errors=error;
            });
    }
    handlechange(event){
        if(event.target.name==='fnumber'){
            this.firstnumber=event.target.value;
        }else if(event.target.name==='Snumber'){
            this.secondnumber=event.target.value;
        }
    }
}