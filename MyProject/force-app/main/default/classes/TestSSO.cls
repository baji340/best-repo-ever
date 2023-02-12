public class TestSSO {
    
    /****
*   Apex Class: secureSSOHandler
*   Purpose: This is called to help with SSO integration.  In Setup>Single Sign-On Settings, the Just-in-time User Provisioning settings specify 
*			secureSSOHandler as the SAML JIT Handler. 
*   
*   Methods:
*   handleUser - creates or updates a User object and it's relevant details
*   createUser - creates and returns a new User object by calling handleUser method
*   updateUser - looks up the user from the id passed in and then calls handleUser to make the updates to it
*
*   This is used for internal Service Cloud MSID users.  The Community Portal OHID users are using other apex classes and configurations. (GD: I'm not sure this is true anymore)
***/

/*global class secureSSOHandler implements Auth.SamlJitHandler{
private class JitException extends Exception{}
	
	//removed parameters boolean isStandard and String federationIdentifier as they aren't used
	private void handleUser(boolean create, User u, Map<String, String> attributes) {
		System.debug('Current attributes passed to handleUser: ' + attributes);
		//retreive user attibutes from the map passed in and use them to set or update the properties of the User
		if(attributes.containsKey('EmployeeID')) {
			u.EmployeeNumber = attributes.get('EmployeeID');
		}
		if(attributes.containsKey('First name')) {
			u.FirstName = attributes.get('First name');
		}
		if(attributes.containsKey('Last name')) {
			u.LastName = attributes.get('Last name');
		}
		if(attributes.containsKey('MSID')){
			u.federationIdentifier = attributes.get('MSID');
		}else{
			System.debug('SAML response does not contain an MSID');
		}

		//Use the email address appended with the environment to create the Salesforce username value
		//Could potentially be smarter about these hard coded environment identifiers later if we think they could change
		if(attributes.containsKey('Email address')) {
			u.Email = attributes.get('Email address');            
			//checking the url to see which environment the user is in    
			if(URL.getSalesforceBaseUrl().toExternalForm().contains('partial')) {
				//user is in Test (partial)
				u.Username = u.Email + '.tops.partial';		//we should change this to make it consistent later
			}else if(URL.getSalesforceBaseUrl().toExternalForm().contains('staging')){
				//user is in Staging
				u.Username = u.Email + '.oip.staging';   
			}else{
				//user is assumed to be in production
				u.Username = u.Email + '.oip';
			}
      	}

		//use the first letter of the first name and the first seven letters of the last name to make the Alias (length limit is 8 char)	
		String alias = '';
		if(u.FirstName == null) {
			alias = u.LastName;
		} else {
			alias = u.FirstName.substring(0,1) + u.LastName;
		}
		if(alias.length() > 8) {
			alias = alias.substring(0, 8);
		}
		u.Alias = alias;

		//Set or update Locale and Language variables for the user, only do on creation to allow for manual adjusting
		String country;
        if(attributes.containsKey('c') && create) {		//attribute "c" is the country
			country = attributes.get('c');
			//currently we are only handling the option if the country is "US"; need to add logic here if we have users in other countries
			//who need to see data in different date formats, languages or other email encoding values
            // 12/27/22: Adding a default in here for now because regardless of the country, I think our users will want these values to be consistent. 
			if(country =='US'){
				u.LocaleSidKey = 'en_US';
				u.LanguageLocaleKey ='en_US';
				u.EmailEncodingKey = 'UTF-8';
			}else{      //putting in default values to cover Chennai users and any others until we determine we want to specialize these values by location.
                u.LocaleSidKey = 'en_US';
				u.LanguageLocaleKey ='en_US';
				u.EmailEncodingKey = 'UTF-8';
            }
		} 

		//Make the best guess at the time zone of a new user based on the State ('st') attribute 
		//We'll be wrong a small % for States with two time zones so only make this guess on user creation not update to allow manual adjusting
        // We default to Eastern Time if the state is not found.  Might want to look at this for other countries.
        // 1/30/23 Added code to accomodate India.  
		// 2/1/23 Added code for the Philippines.  Added a default for countries without states to ET.  
        u.TimeZoneSidKey = 'America/New_York';      //this is the catch all default to start with to prevent required field errors
        if(attributes.containsKey('st') && create) {		
			String state = attributes.get('st');
			switch on state {
				when 'CA', 'NV', 'OR', 'WA' {		
					u.TimeZoneSidKey = 'America/Los_Angeles';
				}	
				when 'AZ', 'CO', 'ID', 'MT', 'NM', 'UT', 'WY' {		
					u.TimeZoneSidKey = 'America/Denver';
				}
				when 'AL', 'AR', 'IL', 'IA', 'KS', 'LA', 'MN', 'MS', 'MO', 'NE', 'ND', 'OK', 'SD', 'TN', 'TX', 'WI' {		
					u.TimeZoneSidKey = 'America/Chicago';
				}
				when 'AK' {		
					u.TimeZoneSidKey = 'America/Anchorage';
				}
				when 'HI' {		
					u.TimeZoneSidKey = 'Pacific/Honolulu';
				}
				when else {		  
					u.TimeZoneSidKey = 'America/New_York';
				}
			}    
		}
        if(country == 'IN') {
            u.TimeZoneSidKey = 'Asia/Kolkata';
        }
        if(country == 'PH') {
            u.TimeZoneSidKey = 'Asia/Manila';
        }
		
        //No updates are needed for Contact or Account objects in this code.
		
		//Set or update the profile from value passed in SAML response back from Secure; attribute exists with "No Groups" as value if no entry in Secure
		if(attributes.containsKey('Profiles')) {
			String profileName = attributes.get('Profiles');
            //remove extra characters from the profile name coming from Secure in SAML response
			profileName = profileName.replace('OI_Provider_Salesforce_', '');
			profileName = profileName.replace('_Test', '').replace('_Staging','').replace('_Stag','').replace('_Prod', '').replace('_', ' ');
            
           	//search for the user's Secure profile in the Salesforce list (needs to match exactly)
			Profile p;
			try{
				p = [SELECT Id FROM Profile WHERE name=:profileName];
			} catch (QueryException qe) {
				//Need this to throw an error to user and not let them in
				System.debug('User Profile value from Secure (in SAML response) does not match to a Salesforce Profile');
				//Deactivate the user in Salesforce if they don't have a valid profile in Secure
				u.isActive = false; 
			}

			//Set or update user's profile to whatever comes back in the SAML response as the role from Secure
			u.ProfileId = p.Id;  

			//We have confirmed the new or existing user has a valid profile in Secure, set the user to active
			u.IsActive = true;
       	}else{
			System.debug('SAML response does not contain Profiles of user');  //Need this to throw an error to user and not let them in
		}

		//update the user record (if not returning the object and automatically inserting a new user)
		if(!create) {
			update(u);
		}         
	}


	global User createUser(Id samlSsoProviderId, Id communityId, Id portalId, String federationIdentifier, Map<String, String> attributes, String assertion) {
		//create a new User u
		User u = new User();
		
		//populate the User with relevant details by calling the handleUser method
		handleUser(true, u, attributes);
		
		//return the new User; should take care of inserting the new user automatically, otherwise re-add insert u; line here or at end of handleUser
		return u; 
	}


	global void updateUser(Id userId, Id samlSsoProviderId, Id communityId, Id portalId, String federationIdentifier, Map<String, String> attributes, String assertion) {
		//find the User by the userId passed into updateUser as a parameter
		User u = [SELECT Id, FirstName, LastName FROM User WHERE Id=:userId];
		
		//call handleUser to make the updates to User u selected above
		handleUser(false, u, attributes);
	}
}*/

}