import { LightningElement,track } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    @track fname =true;
    @track lname=true;
    showfname(){
        this.fname =true;
        this.lname=false;
    }
    showlname(){
        this.fname =false;
        this.lname=true; 
    }
}