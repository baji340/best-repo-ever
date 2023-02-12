import { LightningElement, track, wire } from 'lwc';
import searchBears from '@salesforce/apex/PopupData.getAccounts';

export default class SelectPicklist extends LightningElement() {
  @track searchTerm = '';
    @track bears;
    @track ranger;
    @track left;
    @track top;

    @wire(searchBears)
    loadBears(result) {
        this.bears = result;
    }
    showData(event){
        this.ranger = event.currentTarget.dataset.rangerid;
        this.left = event.clientX;
        this.top=event.clientY;
    }
    hideData(event){
        this.ranger = "";
    }
    get assignClass() { 
        return this.active ? '' : 'slds-hint-parent';
  }
}