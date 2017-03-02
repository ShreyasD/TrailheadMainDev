@isTest
private class AccountProcessorTest {
	
	@isTest static void testCountContacts() {
		Account acc = new Account(Name = 'Test Account');
		insert acc;

		Contact cnt1 = new Contact(FirstName = 'Test', LastName = 'Contact 1', AccountId = acc.Id);
		Contact cnt2 = new Contact(FirstName = 'Test', LastName = 'Contact 2', AccountId = acc.Id);
		List<Contact> contactList = new List<Contact>{cnt1, cnt2};
		insert contactList;

		Test.startTest();
			AccountProcessor.countContacts(new List<Id>{acc.Id});
		Test.stopTest();

		acc = [Select Id, Name, Number_of_Contacts__c
		       From Account
		       Where Id =: acc.Id];
		System.assertEquals(contactList.size(), acc.Number_of_Contacts__c);

	}
	
}