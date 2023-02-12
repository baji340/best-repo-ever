import { LightningElement,api } from 'lwc';

export default class ParentCommunication extends LightningElement {
    @api searchvalue
    handlesearchvalue(event){
        this.searchvalue=event.detail;
    }
}