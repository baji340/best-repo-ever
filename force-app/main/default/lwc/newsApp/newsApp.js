import { LightningElement, api } from "lwc";
import callNewsPoint from "@salesforce/apex/ArticleDataController.callNewsPoint";

export default class NewsApp extends LightningElement {
  
  /**Getting Data from the Server Side Controller.Ideally do the error handling for the returend data using error attribute **/
  //@wire(callNewsPoint)
  @api newsarticles;
  
}