import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
export default class Bindwithproperty extends LightningElement {
    @wire(getAccounts) accounts;
}