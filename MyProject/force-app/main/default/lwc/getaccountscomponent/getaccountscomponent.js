import { LightningElement, track, wire } from 'lwc';
import getaccount from '@salesforce/apex/GetAccounts.getaccount';
export default class Getaccountscomponent extends LightningElement {
    @track data;
    @wire(getaccount) acc({error,data}){
        if(data){
            this.data=data;

        }else if(error){
            this.error=undefined;
        }
    }
}