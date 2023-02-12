import { LightningElement, track } from 'lwc';

export default class Cal extends LightningElement {
    @track firstnumber=0;
    @track secondnumber=0;
    @track result=0;

    handlechange(event){
        if(event.target.name=='fnumber'){
        this.firstnumber=event.target.value
        }
        if(event.target.name=='snumber'){
            this.secondnumber=event.target.value;
        }
        this.result=parseInt(this.firstnumber)+parseInt(this.secondnumber);
    }

}