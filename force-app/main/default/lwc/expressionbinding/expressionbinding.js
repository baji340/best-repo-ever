import { LightningElement } from 'lwc';

export default class Expressionbinding extends LightningElement {
    FullName = '';
    Phone = '';
    Email = '';
    handleonchange(event){
        const field=event.target.name;
        if(field == "FullName"){
            this.FullName=event.target.value;
        }
        else if(field == "Phone"){
            this.Phone=event.target.value;

        }
        else{
            this.Email=event.target.value;
        }
    }
}