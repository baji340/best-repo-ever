import { LightningElement,track } from 'lwc';

export default class Welcomemessage extends LightningElement {
    @track message;
    handlechange(event){
        this.message=event.target.value;
    }
}