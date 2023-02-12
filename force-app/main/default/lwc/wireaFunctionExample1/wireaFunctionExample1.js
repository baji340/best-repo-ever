import { LightningElement,api,track,wire } from 'lwc';
import getAccountData from '@salesforce/apex/getAccountRecord1.getAccountRecordMethod';
export default class WireaFunctionExample1 extends LightningElement {
    @api accName;

    @track accountRecord;

    @track error;

    handleChange(event){

        const userInput = event.target.value;

        this.accName= userInput;

    }

 

    @wire(getAccountData,{ accNameParamInApex: '$accName'}) 

    accountsData({ error, data }) {

        if (data) {

            //console.log('RecordId is'+recordId);

            this.accountRecord = data;

            this.error = undefined;

        } else if (error) {

            //console.log('Error block');

            this.error = error;

            this.accountRecord = undefined;

        }

    }
}