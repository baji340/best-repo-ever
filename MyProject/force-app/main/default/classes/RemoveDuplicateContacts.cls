public class RemoveDuplicateContacts {

    public static void duplicateremoves(){   
            List<contact> fulllist = [Select ID, email from contact];
			set<string> DuplicateCheck = new set<string>();
			list<contact> DupAccountIds = new list<contact>();
			for(contact con: fulllist){
				if(!DuplicateCheck.add(con.email))
					DupAccountIds.add(con);
					}

				delete DupAccountIds;
    }
}