@isTest
private class TestRestrictContactByName {
	
	@isTest static void testInvalidContact() {
		Contact invalidContact = new Contact(
			FirstName = 'Test',
			LastName = 'INVALIDNAME');
		
		try {
			insert invalidContact;
		} catch (DmlException ex) {
			System.assert(ex.getMessage().contains('The Last Name "' + invalidContact.LastName + '" is not allowed for DML'));
		}
	}
	
}