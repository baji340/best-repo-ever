import { LightningElement } from 'lwc';

export default class ChildComponentCustomEventwithData extends LightningElement {
    endValue = 5;
    handleOnClick(){
        const myEventwithValue = new CustomEvent('increasecount',{
            detail:{
                endValue : this.endValue,
                msg : "I am String"

            }
        });
        this.dispatchEvent(myEventwithValue);
    }
}