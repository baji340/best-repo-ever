import { LightningElement, track } from 'lwc';
import findaccounts from '@salesforce/apex/AccountController.findaccounts';
const DELAY=350;
export default class Bispaccountfind extends LightningElement {
    @track accounts;
    @track error;
    searchrecord(event){
        window.clearTimeout(this.delayTimeout);
        const searchkey=event.target.value;
        this.delayTimeout=setTimeout(() =>{
            findaccounts({searchkey})
                .then(result => {
                    this.accounts=result;
                    this.error=undefined;

                })
                .catch(error =>{
                    this.error=error;
                    this.accounts=undefined;
                });
            
        },DELAY);
    }
}