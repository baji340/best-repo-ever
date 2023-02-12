import { LightningElement,api } from 'lwc';

export default class Childcompdemo extends LightningElement {
    @api childcompname='Name of comp is childcomp';
    @api childcompdescription='Description of comp is testing';
    handlechildclick(event){
        const evt= new CustomEvent('myfirstevent', {detail:{childcompname:this.childcompname,childcompdescription:this.childcompdescription}});
        this.dispatchEvent(evt);
    }
}