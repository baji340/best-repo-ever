import { LightningElement, track } from 'lwc';
import addition from '@salesforce/apex/Addningtwonubers.addition';

export default class Mehodwithparameters extends LightningElement {
    @track fnumber;
    @track snumber;
    @track sum;
    @track errors;
    handleclick(){
        addition({fnumber: this.fnumber,snumber:this.snumber})
        .then(result=>{
            this.sum=result;
        })
        .catch(error=>{
            this.errors=error;
        });
    }
    handlechange(event){
        if(event.target.name==='fnumber'){
            this.fnumber=event.target.value;
        }
        if(event.target.name==='snumber'){
            this.snumber=event.target.value;
        }
    }
}