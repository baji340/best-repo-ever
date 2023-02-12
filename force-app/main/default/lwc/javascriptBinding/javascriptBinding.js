import { LightningElement } from 'lwc';

export default class JavascriptBinding extends LightningElement {
    myvalue="Salesforce bolt";
    handleonchange(event){
        this.myvalue=event.target.value;
    }
}