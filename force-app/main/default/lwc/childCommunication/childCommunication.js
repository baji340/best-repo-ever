import { api, LightningElement } from 'lwc';

export default class ChildCommunication extends LightningElement {
    @api searchkey;
    handleChange(event){
        this.searchkey=event.target.value;
        const searchevent=new CustomEvent("getsearchvalue",{
            detail:this.searchkey
        });
        this.dispatchEvent(searchevent);
    }
}