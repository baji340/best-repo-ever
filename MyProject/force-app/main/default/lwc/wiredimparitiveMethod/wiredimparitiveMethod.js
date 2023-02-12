import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
export default class WiredimparitiveMethod extends LightningElement {
    accounts;
    error;
    buttonClick(){
        getAccounts()
        .then((result) =>{
            this.accounts = result;
            this.error = undefined;
        })
        .catch((error)=>{
            this.error = error;
            this.accounts = undefined;
        });

    
    }
}