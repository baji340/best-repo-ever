import { LightningElement,api,track,wire } from 'lwc';
import getAccountData from '@salesforce/apex/getAccountRecord.getAccountRecordMethod';
export default class WireaFunctionExample extends LightningElement {
    @api recordId;
    @track therecords;
    @track error;

    @wire (getAccountData, {recordIdAccount:'$recordId'})
    accountsData({ error, data }) {
    if(data){
        this.therecords=data;
        this.error=undefined;
    }
    else{
        this.error=error;
        this.therecords=undefined;
    }
}
}