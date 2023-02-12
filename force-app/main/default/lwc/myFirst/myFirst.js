import { LightningElement, track} from 'lwc';
export default class MyFirst extends LightningElement {
    @track greetings='Hellow world';

    @track contacts=[
        {
            id:'003456474774756676',
            name:'baji'
        }
    ];
   
      
}