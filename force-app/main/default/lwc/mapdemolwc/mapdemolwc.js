import { LightningElement,track, wire } from 'lwc';
import getDataFromApex from '@salesforce/apex/mapkeyvalueapexcontroller.methodName';
export default class Mapdemolwc extends LightningElement {

    @track mapkeyvaluestore=[];
    @wire(getDataFromApex)
    getResult(result){
        if(result.data){
            for(var key in result.data)
            this.mapkeyvaluestore.push({key:key,value:result.data[key]});        
        }
        else{
            console.log("some error");
        }
    }

}