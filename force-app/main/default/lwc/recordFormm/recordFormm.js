import { LightningElement, track } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
export default class RecordFormm extends NavigationMixin (LightningElement) {
    @track objectApiName='Account';
    @track fieldslist=[NAME_FIELD,TYPE_FIELD,INDUSTRY_FIELD];
    handlesuccess(event){
        const conevent = new ShowToastEvent({
            title: 'Toast message',
            message: 'Record id'+event.detail.id,
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(conevent);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.detail.id,
                objectApiName: 'Account',
                actionName: 'view'
            },
        });
    }
}