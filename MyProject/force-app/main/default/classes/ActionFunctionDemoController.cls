public with sharing class ActionFunctionDemoController {
  
  public Account cat {get;set;}
  public String message {get;set;}
  
  public ActionFunctionDemoController() {
    cat = new Account();
  }
  
  public PageReference save() { 
    try {
      insert cat;
      message = 'Insert successful! -- ';
    } catch (Exception e) {
      ApexPages.addMessages(e);
      message = 'Whoops! An error occurred -- ' + e.getMessage();      
    }
    return null;
  }

}