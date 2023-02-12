import { LightningElement } from 'lwc';

export default class ParentDemoComp extends LightningElement {
    handleButtonClick(){
        this.template.querySelector("c-child-demo-comp").childMethod();
    }
}