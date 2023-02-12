public class deliverablesController {
  
  // Constructor
 public deliverablesController(ApexPages.StandardController controller) {
  this.proj = (Account)controller.getSubject();
  system.debug('thisproj'+this.proj);
     this.delivers = [ SELECT d.Name,d.id 
      FROM 
      Contact d 
      WHERE 
      d.Accountid = :proj.id ];
 }
 
 // Action Method called from page button
 public pagereference saveChanges() { 
  upsert this.delivers;
  return null;
 }
 
 // Action Method called from page link
 public pagereference newDeliverable() { 
  Contact d = new Contact();
  d.Accountid =this.proj.id; 
  delivers.add( d );
  return null;
 }
 
 // public Getter to provide table headers 
 public string[] getheaders() { return new string [] 
  {'Name','id' } ; }
 
 // public Getter to list project deliverables
 public Contact[] getDeliverables() { 
  return this.delivers; 
 } 
 
 // class variables
 Account proj;
 Contact[] delivers; 
}