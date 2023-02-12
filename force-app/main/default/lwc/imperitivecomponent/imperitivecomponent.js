import { LightningElement, track } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.imperitivecall';
export default class Imperitivecomponent extends LightningElement {
    @track columns=[
        {label: 'Name', fieldName: 'Name', type: 'text' },
        {label: 'Phone', fieldName: 'phone', type: 'phone' },
    ];
    @track data;
    @track errors;
    ConnectedCallback(){
        getAccounts()
              .then(result=>{
                  this.data=result;
              })
              .catch(error=>{
                this.data=undefined;
            });
    }
}