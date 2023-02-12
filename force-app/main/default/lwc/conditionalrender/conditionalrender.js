import { LightningElement } from 'lwc';

export default class Conditionalrender extends LightningElement {
    myvalue="salesforce bolt";
    showme="false";
    handleonchange(event){
        this.showme=event.target.checked
    }
}