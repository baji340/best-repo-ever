import { LightningElement } from 'lwc';

export default class ParentComponentCustomEventwithData extends LightningElement {
    count=1;
    endvalue=0;
    msg='default msg';
    handleEventChange(event) {
        this.endValue = event.detail.endValue;
        this.msg = event.detail.msg;
        if(this.count < this.endValue)
        this.count = this.count + 1;
    }
}