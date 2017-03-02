public with sharing class ContactAndLeadSearch {
	public static List<List<sObject>> searchContactsAndLeads(String name) {
		return [FIND :name In NAME Fields
				RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)];
	}
}