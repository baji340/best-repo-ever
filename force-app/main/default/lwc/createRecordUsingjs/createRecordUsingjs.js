import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import {createRecord} from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
export default class CreateRecordUsingjs extends NavigationMixin(LightningElement) {
    name='';
    phone='';
    handlechange(event){
        if(event.target.label=='Name'){
            this.name=event.target.value;
        }else if(event.target.label=='Phone'){
            this.phone=event.target.value;
        }
    }
    handleClick(){
        console.log('Entered');
        const fields={};
        fields[NAME_FIELD.fieldApiName]=this.name;
        fields[PHONE_FIELD.fieldApiName]=this.phone;
        const recordInput={ apiName : ACCOUNT_OBJECT.objectApiName, fields};
        createRecord(recordInput)
            .then(account =>{
                console.log('Test'+account);
                this.accountId=account.id;
                const conevt = new ShowToastEvent({
                    title: 'Success',
                    message: 'Account Created',
                    variant: 'success',
                    mode: 'dismissable'
                });
                this.dispatchEvent(conevt);
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: account.id,
                        objectApiName: 'Account',
                        actionName: 'view'
                    },
                });
            })
            .catch(Error =>{

            });
    }
}