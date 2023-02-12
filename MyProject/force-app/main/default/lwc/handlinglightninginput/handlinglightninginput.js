import { LightningElement,track } from 'lwc';

export default class Handlinglightninginput extends LightningElement {
    @track message = "hellow sfdc";
    handlechange(event){
        this.message=event.target.value;
    }

}