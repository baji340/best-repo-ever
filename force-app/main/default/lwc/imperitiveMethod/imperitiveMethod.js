import { LightningElement,track } from 'lwc';
import getAccounts from '@salesforce/apex/Acc.getAllAccounts';
export default class ImperitiveMethod extends LightningElement {
    @track accountrecords;
    @track error;
    @track coloumns=[
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'phone'},
        {label:'Industry',fieldName:'Industry',type:'text'},
    ];
    connectedCallback(){
        getAccounts()
            .then(result=>{
                this.accountrecords=result;
            })
            .catch(error=>{
                this.error=error;
            });
    }
}