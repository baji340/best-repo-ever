import { LightningElement,api,wire } from 'lwc';
import {getRecord} from 'lightning/uiRecordApi';
const FIELDS = ['Contact.Name', 'Contact.Phone'];
export default class GetRecordLWCExample extends LightningElement {
    @api recordId;
    contactData;
    contactName;
    contactPhone;
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS, modes : ['View', 'Edit', 'Create']})
    wiredRecord({error,data}){
        if(error){
            console.log('Recived error');
        }
        else if(data){
            this.contactData=data;
            this.contactName =   this.contactData.fields.Name.value;
            this.contactPhone =  this.contactData.fields.Phone.value;
        }
    }


}