import { LightningElement,api } from 'lwc';

export default class ChildLwcComp extends LightningElement {
    @api childcompname='childLwcComp';

    @api childcompdescription='Test Description';

    handleChildAction(){

        const evt= new CustomEvent('myfirstevent', {detail:{childcompname:this.childcompname,childcompdescription:this.childcompdescription}});

        this.dispatchEvent(evt);

    }
}