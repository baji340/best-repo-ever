import { LightningElement } from 'lwc';
import Account_Object from '@salesforce/schema/Account';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import Name from '@salesforce/schema/Account.Name';
import Phone from '@salesforce/schema/Account.Phone';
import Revenue from '@salesforce/schema/Account.AnnualRevenue';
export default class CreateanewRecord extends LightningElement {
    objectapi =Account_Object;
    fields=[Name,Phone,Revenue];
    handleonsuccess(event){
        const toastEvent=new ShowToastEvent({
            title:"Account has been created successfully !",
            message: "Account Created : "+event.details.id,
            variant: "success"
        });
        this.dispatchEvent(toastEvent);
}
}