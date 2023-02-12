import { LightningElement } from 'lwc';

export default class ParentWebcomponent extends LightningElement {
    handleClick(){
        this.template.querySelector("c-child-web-component").handleValueChange();

    }
}