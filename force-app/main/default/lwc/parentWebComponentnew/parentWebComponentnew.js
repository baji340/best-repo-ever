import { LightningElement } from 'lwc';

export default class ParentWebComponentnew extends LightningElement {
    handleClick(){
        this.template.querySelector("c-child-Web-component").handleValueChange();
    }
}