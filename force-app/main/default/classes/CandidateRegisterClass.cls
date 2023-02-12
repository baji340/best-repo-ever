public class CandidateRegisterClass {
    public Candidate__c candidate	{set;get;}
    public CandidateRegisterClass(){
        candidate=new Candidate__c();
    }
    public PageReference Saverecords(){
        insert candidate;
        PageReference pr=new PageReference('/apex/thankyoupage');
        return pr;
    }
}