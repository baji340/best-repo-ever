import { LightningElement, track,wire } from 'lwc';
import getAccounts from '@salesforce/apex/Acc.getAccounts';
export default class DataTable extends LightningElement {
    @track data;
    @track coloumns=[
        {label:'Name',fieldName:'Name',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'phone'},
        {label:'Industry',fieldName:'Industry',type:'text'},
    ];
    @wire(getAccounts) Accountrecords({error,data}){
        if(data){
            this.data=data;
            console.log(data);
        }else if(error){
            this.data=undefined;
        }
    }
}