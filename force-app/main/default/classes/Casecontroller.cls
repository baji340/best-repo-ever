public class Casecontroller {
    public list<ContentDocument> Files{set;get;}
    Public list<ContentDocumentLink> ConDocLink {set;get;}
    public ContentVersion Conver1{set;get;}
    public list<ContentVersion> Conlist	{set;get;}
    public string type	{set;get;}
    public string Title1 {set;get;}
    public Blob versiondata1{set;get;}
    public string Title2 {set;get;}
    public Blob versiondata2{set;get;}
    public string Type1	{set;get;}
    public string Title3 {set;get;}
    public Blob versiondata3{set;get;}
    public string Type2	{set;get;}
    public string Title4 {set;get;}
    public Blob versiondata4{set;get;}
    public string type3	{set;get;}
    public string Title5 {set;get;}
    public Blob versiondata5{set;get;}
    public string type4	{set;get;}
    public list<ContentDocumentLink> ConDoc{set;get;}
    public Case newCase {get; set;}
    public Casecontroller(ApexPages.StandardController controller) {
        newCase = new Case();
        Files = new List<ContentDocument>();
        Conver1=new ContentVersion();
        ConDocLink=new list<ContentDocumentLink>();
        Conlist=new list<ContentVersion>();
    }
     public PageReference UploadFile(){
        return null;
    }
          
    // Actions when the Save button is clicked
    public Void save() {
    
            //set some additional field values and try to insert the new Case
            newCase.Origin = 'Web';
            System.debug('Attempt to insert case');
            insert newCase;
            System.debug(newCase.Id);
            
            //----------------------------------------------------------------------
            //Below is not pretty code.  The reason it is done like this is because
            //the page context can only be 135Kb in size.  If the attachments are
            //added individually then that context size limit is exceeded and the 
            //page fails.  A better approach would be to have the attachments saved
            //off with no case ID and then once the case ID is saved the attachments
            //are updated to reflect the new case ID.
            //-----------------------------------------------------------------------
            if(Title1 != null && versiondata1 != null && Type!=null)  
            {  
                ContentVersion conVer = new ContentVersion();
                conVer.ContentLocation = 'S'; // S specify this document is in SF, use E for external files
                conVer.PathOnClient =this.Type; // The files name, extension is very important here which will help the file in preview.
                conVer.Title = This.Title1; // Display name of the files
                conVer.VersionData = versiondata1; // converting your binary string to Blog
                insert conVer;
                Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
 
                    //Create ContentDocumentLink
                    ContentDocumentLink cDe1 = new ContentDocumentLink();
                    cDe1.ContentDocumentId = conDoc;
                    cDe1.LinkedEntityId = newcase.Id; // you can use objectId,GroupId etc
                    cDe1.ShareType = 'I'; // Inferred permission, checkout description of ContentDocumentLink object for more details
                    cDe1.Visibility = 'InternalUsers';
                    ConDocLink.add(cDe1);
            }
        if(Title2 != null && versiondata2 != null && Type1!=null)  
            {  
                ContentVersion conVer = new ContentVersion();
                conVer.ContentLocation = 'S'; // S specify this document is in SF, use E for external files
                conVer.PathOnClient =this.Type1; // The files name, extension is very important here which will help the file in preview.
                conVer.Title = This.Title2; // Display name of the files
                conVer.VersionData = versiondata2; // converting your binary string to Blog
                insert conVer;
                Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
 
                    //Create ContentDocumentLink
                    ContentDocumentLink cDe2 = new ContentDocumentLink();
                    cDe2.ContentDocumentId = conDoc;
                    cDe2.LinkedEntityId = newcase.Id; // you can use objectId,GroupId etc
                    cDe2.ShareType = 'I'; // Inferred permission, checkout description of ContentDocumentLink object for more details
                    cDe2.Visibility = 'InternalUsers';
                    ConDocLink.add(cDe2);
            }
        if(Title3 != null && versiondata3 != null && Type2!=null)  
            {  
                ContentVersion conVer = new ContentVersion();
                conVer.ContentLocation = 'S'; // S specify this document is in SF, use E for external files
                conVer.PathOnClient =this.Type2; // The files name, extension is very important here which will help the file in preview.
                conVer.Title = This.Title3; // Display name of the files
                conVer.VersionData = versiondata3; // converting your binary string to Blog
                insert conVer;
                Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
 
                    //Create ContentDocumentLink
                    ContentDocumentLink cDe3 = new ContentDocumentLink();
                    cDe3.ContentDocumentId = conDoc;
                    cDe3.LinkedEntityId = newcase.Id; // you can use objectId,GroupId etc
                    cDe3.ShareType = 'I'; // Inferred permission, checkout description of ContentDocumentLink object for more details
                    cDe3.Visibility = 'InternalUsers';
                    ConDocLink.add(cDe3);
            }
        if(Title4 != null && versiondata4 != null && Type3!=null)  
            {  
                ContentVersion conVer = new ContentVersion();
                conVer.ContentLocation = 'S'; // S specify this document is in SF, use E for external files
                conVer.PathOnClient =this.Type3; // The files name, extension is very important here which will help the file in preview.
                conVer.Title = This.Title4; // Display name of the files
                conVer.VersionData = versiondata4; // converting your binary string to Blog
                insert conVer;
                Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
 
                    //Create ContentDocumentLink
                    ContentDocumentLink cDe4 = new ContentDocumentLink();
                    cDe4.ContentDocumentId = conDoc;
                    cDe4.LinkedEntityId = newcase.Id; // you can use objectId,GroupId etc
                    cDe4.ShareType = 'I'; // Inferred permission, checkout description of ContentDocumentLink object for more details
                    cDe4.Visibility = 'InternalUsers';
                    ConDocLink.add(cDe4);
            }
        if(Title5 != null && versiondata5 != null && Type4!=null)  
            {  
                ContentVersion conVer = new ContentVersion();
                conVer.ContentLocation = 'S'; // S specify this document is in SF, use E for external files
                conVer.PathOnClient =this.Type4; // The files name, extension is very important here which will help the file in preview.
                conVer.Title = This.Title5; // Display name of the files
                conVer.VersionData = versiondata5; // converting your binary string to Blog
                insert conVer;
                Id conDoc = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:conVer.Id].ContentDocumentId;
 
                    //Create ContentDocumentLink
                    ContentDocumentLink cDe5 = new ContentDocumentLink();
                    cDe5.ContentDocumentId = conDoc;
                    cDe5.LinkedEntityId = newcase.Id; // you can use objectId,GroupId etc
                    cDe5.ShareType = 'I'; // Inferred permission, checkout description of ContentDocumentLink object for more details
                    cDe5.Visibility = 'InternalUsers';
                    ConDocLink.add(cDe5);
            }
        		insert ConDocLink;
    
        }
        
    }