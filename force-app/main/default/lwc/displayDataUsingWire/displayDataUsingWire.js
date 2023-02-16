import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/Acc.getAccounts';
export default class DisplayDataUsingWire extends LightningElement {
    @track data;
    @wire(getAccounts) accountrecords({error,data}){
        if(data){
            this.data=data;
            console.log(data);
        }else if(error){
            this.data=undefined;
            console.log(error);
        }
    }

}