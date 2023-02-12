import { LightningElement } from 'lwc';
import findAccountList from '@salesforce/apex/AccountController.findAccList';
export default class BindImperitiveMethodwithparam extends LightningElement {
        searchKey='';
        accounts;
        error;
    
        handleonchange(event){
            this.searchKey = event.target.value;
        }
    
        buttonClick(){
            findAccountList({keyword: this.searchKey})
            .then((result) =>{
                this.accounts = result;
                this.error = undefined;
            })
            .catch((error)=>{
                this.error = error;
                this.accounts = undefined;
            });
    
        }
    }