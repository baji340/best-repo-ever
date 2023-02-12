import { LightningElement,api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import Name from '@salesforce/schema/Account.Name';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
export default class Recordeditformexample extends NavigationMixin (LightningElement) {
    Fields=[NAME_FIELD,PHONE_FIELD,TYPE_FIELD];
    @api objectApiName='Account';
    
    handlesuccess(event){
        const evt = new ShowToastEvent({
            title: "Account hasbeen created",
            message: "Account id" +event.detail.id,
            variant: "success"
        });
        this.dispatchEvent(evt);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.detail.id,
                objectApiName: 'Account',
                actionName: 'view'
            }
        });
 
}
    }