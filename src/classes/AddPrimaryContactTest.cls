@isTest
private class AddPrimaryContactTest {
	
	@testsetup
	static void setup() {
		List<Account> accounts = new List<Account>();

		// add 200 accounts
        for (Integer i = 0; i < 100; i++) {
            accounts.add(new Account(
                name='Test Account'+i,
                BillingState = (Math.mod(i, 2) > 0) ? 'NY' : 'CA'
            ));
        }

        insert accounts;
	}

	@isTest static void testQueueable() {
		Contact ontarioContact = new Contact(
				FirstName = 'Test CA',
				LastName = 'Contact'
			);

		AddPrimaryContact queueable = new AddPrimaryContact(ontarioContact, 'CA');

		Test.startTest();
			System.enqueueJob(queueable);
		Test.stopTest();

		for(Account acc : [Select Id, Name, BillingState,
						 		  (Select Id, Name
						 		   From Contacts)
						   From Account
						   Where BillingState = 'CA']) {
			for(Contact cnt : acc.Contacts) {
				System.assertEquals(cnt.Name, 'Test CA Contact');
			}
		}

	}
	
}