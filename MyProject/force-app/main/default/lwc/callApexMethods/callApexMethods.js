import { LightningElement, wire} from 'lwc';
import fetchOpportunityList from '@salesforce/apex/OpportunityController.fetchOpportunityList';
export default class CallApexMethods extends LightningElement {
    @wire (fetchOpportunityList) opps;
}