import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
export default class ShowToastmessages extends LightningElement {
    Showwarning(){
        const evt=new ShowToastEvent({
            title : 'This is warning message',
            msg : 'warning msg',
            variant : 'warning'
        });
        this.dispatchEvent(evt);
    }
    Showsuccess(){
        const evt=new ShowToastEvent({
            title : 'This is success message',
            msg : 'Success msg',
            variant : 'Success'
        });
        this.dispatchEvent(evt);
    }
    Showinfo(){
        const evt=new ShowToastEvent({
            title : 'This is info message',
            msg : 'info msg',
            variant : 'info'
        });
        this.dispatchEvent(evt);
    }
    Showerror(){
        const evt=new ShowToastEvent({
            title : 'This is Error message',
            msg : 'Error msg',
            variant : 'Error'
        });
        this.dispatchEvent(evt);
    }
}