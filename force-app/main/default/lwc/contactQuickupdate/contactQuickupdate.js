import { LightningElement,api } from 'lwc';
import Contact_FirstName from '@salesforce/schema/Contact.FirstName';
import Contact_LastName from '@salesforce/schema/Contact.LastName';
import Contact_Email from '@salesforce/schema/Contact.Email';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ContactQuickupdate extends LightningElement {
    @api recordId;
    @api objectApiName;
    @api fieldslist=[Contact_FirstName,Contact_LastName,Contact_Email];
    handleContactUpdate(event){
        const conevent = new ShowToastEvent({
            title: 'Toast message',
            message: 'Record'+event.detail.fields.LastName.value,
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(conevent);
    }
}