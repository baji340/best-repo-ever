import { LightningElement,api,track,wire } from 'lwc';

//import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import getRecord from '@salesforce/apex/LoanAccountController.getloans';
import updateRecord from '@salesforce/apex/LoanAccountController.updateRecord';
import { NavigationMixin } from 'lightning/navigation';

export default class LwcPicklistWithRecordtype extends NavigationMixin (LightningElement) {
    @api
    recordId="0012v00003OXTitAAH";
    record;
    @api currentRecordId;
    @api add=0;
    value="";
    Fees="";
    displaysc1=true;
    displaysc2=false;
    displaysc3=false;
    selectValue;
    activeSectionsMessage='';
    @wire(getRecord, {recordId: '0012v00003OXTitAAH'}) 
    wiredAccount({ error, data }) {
        if (data) {
            console.log('++++'+this.data);
            this.record = data[0];
        } else if (error) {
            console.log('Something went wrong:', error);
        }
    }   
     /* renderedCallback() {
        console.log(this.record.data);
      }*/
      
      //4. Fetch the field values from the record
      get name() {
        return this.record?.Name;
      }
    
      get Numcon() {
        return this.record?.Number_of_Contacts__c;
      }
    
      get Numloc() {
        return this.record?.NumberofLocations__c;
      }
      get totalval(){
          if(this.value!="charge waiver"){
          return this.Numcon+this.Numloc;
          }else if(this.value=="charge waiver" && this.Fees=="Fees"){
            return this.Numcon+this.Numloc;
          }

      }
    get options() {
        return [
            { label: 'Interest Waiver', value: 'interest waiver' },
            { label: 'Charge waiver', value: 'charge waiver' },
            { label: 'Interest On Arrears Waiver', value: 'interest on arrears waiver' },
        ];
    }
    get options1() {
        return [
            { label: 'Fees', value: 'Fees' },
        ];
    }
    handleChangeFees(event) {
        this.Fees = event.detail.value;
    }

    handleChange(event){
        this.value = event.target.value;
        if(this.value=="interest waiver"){
            this.displaysc1=true;
            this.displaysc2=false;
            this.displaysc3=false;
        }
        else if(this.value=="charge waiver"){
            this.displaysc1=false;
            this.displaysc2=true;
            this.displaysc3=false;
        }
        else if(this.value=="interest on arrears waiver"){
            this.displaysc1=false;
            this.displaysc2=false;
            this.displaysc3=true;
        }
        else{
            this.displaysc1=true;
            this.displaysc2=false;
            this.displaysc3=false;
        }

     }

     handleClick() {
        updateRecord({accId:'0012v00003OXTitAAH'
 
        })
        .then(result => {
            console.log(result);
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: '0012v00003OXTitAAH',
                    //objectApiName: 'Case', // objectApiName is optional
                    actionName: 'view'
                }
            });
        })
        .catch(error => {
            console.log(error);
        });
    }
    handleCancel(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0012v00003OXTitAAH',
                //objectApiName: 'Case', // objectApiName is optional
                actionName: 'view'
            }
        });
    }
    @track objRecordId;
    handleMouseover(event) {
        console.log('Test'+this.recordId);
        this.objRecordId = null
        const toolTipDiv = this.template.querySelector('div.ModelTooltip');
        toolTipDiv.style.opacity = 1;
        toolTipDiv.style.display = "block";
        // eslint-disable-next-line
        window.clearTimeout(this.delayTimeout);
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        this.delayTimeout = setTimeout(() => {
            this.objRecordId = this.recordId;
        }, 50);
    }

    /* Handle Mouse Out*/
    handleMouseout() {
        const toolTipDiv = this.template.querySelector('div.ModelTooltip');
        toolTipDiv.style.opacity = 0;
        toolTipDiv.style.display = "none";
    }


}