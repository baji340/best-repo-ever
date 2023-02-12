import { api, LightningElement, track } from 'lwc';

export default class ChildDemoComp extends LightningElement {
    @track messagefromparent;
    @track parentcompname;
    @api childMethod(){
        this.messagefromparent='ParentCompMsg';
        this.parentcompname='ParentCompName';
        
    }
}