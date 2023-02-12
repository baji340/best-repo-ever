import { track } from "lwc";
import { LightningElement,api} from 'lwc';

export default class ChildWebComponent extends LightningElement {
    @track intvalue=100;
    @api handleValueChange(){
        this.intvalue=200;
    }
}