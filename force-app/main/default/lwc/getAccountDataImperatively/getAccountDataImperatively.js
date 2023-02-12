import { LightningElement,track } from 'lwc';
import getAccountRecordMethod from '@salesforce/apex/customAccountController.getAccountRecordMethod';
export default class GetAccountDataImperatively extends LightningElement {
    @track datarecords;
    @track error;
    @track accountrecord;

    handleChange(event){
        const evt=event.target.value;
        this.accountrecord=evt;
    }
    handleChangeMethod() {
    getAccountRecordMethod({accNameParamInApex : this.accountrecord})
        .then(result=>{
            this.datarecords=result;
            this.error=undefined;
        })
        .catch(error=>{
            this.datarecords=undefined;
            this.error=error;
        });
    
    }

}