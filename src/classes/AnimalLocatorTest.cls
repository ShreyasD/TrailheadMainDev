@isTest
private class AnimalLocatorTest {
	
	@isTest static void testGetAnimalNameById() {
		Integer id = 12345;
		String name = 'Horse';
		String eats = 'Hay';
		String says = 'Neigh';

		Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

		// This causes a fake response to be sent
	    // from the class that implements HttpCalloutMock
	    String response = AnimalLocator.getAnimalNameById(12345);
	    System.assertEquals(response, name);
	}
	
}