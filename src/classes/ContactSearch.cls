public with sharing class ContactSearch {
	public static List<Contact> searchForContacts(String lastName, String postalCode) {
		return [Select Id, Name
				From Contact
				Where LastName =: lastName
				And MailingPostalCode =: postalCode];
	}
}