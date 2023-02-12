import { LightningElement, wire } from 'lwc';
import {getSObjectValue} from '@salesforce/apex';
import getSingleAcc from '@salesforce/apex/AccountController.getSingleAccount';
import Name_Field from '@salesforce/schema/Account.Name';
import Phone_field from '@salesforce/schema/Account.Phone';
export default class BindUsingApexSchema extends LightningElement {
    @wire(getSingleAcc)account;

    get name(){
        return this.account.data ? getSObjectValue(this.account.data , Name_Field) : '';
    }
    get phone(){
        return this.account.data ? getSObjectValue(this.account.data , Phone_field) : '';
    }
}