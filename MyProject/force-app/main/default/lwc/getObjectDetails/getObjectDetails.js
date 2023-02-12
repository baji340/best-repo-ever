import { LightningElement,wire } from 'lwc';
import {getObjectInfo} from 'lightning/uiObjectInfoApi';
export default class GetObjectDetails extends LightningElement {
    objectApiName;
    @wire(getObjectInfo,{objectApiName : '$objectApiName'})
    objectInfo;

    handleClick(){
        this.objectApiName = this.template.querySelector('lightning-input').value;
        console.log('###Object Name : '+this.objectApiName);
    }

    get objectMetadata(){
        return this.objectInfo ? JSON.stringify(this.objectInfo.data,null, 10):'';
    }
}