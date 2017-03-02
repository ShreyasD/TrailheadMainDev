@isTest
private class LeadProcessorTest {
	
	@isTest static void testLeadProcessor() {
		//Create Leads
		List<Lead> leadList = new List<Lead>();
		for(Integer i = 1; i <= 200; i++) {
			leadList.add(new Lead(
					FirstName = 'Test Lead',
					LastName = String.valueOf(i),
					Company = 'Test Company'
				));
		}
		insert leadList;

		Test.startTest();
			LeadProcessor lp = new LeadProcessor();
			Database.executeBatch(lp);
		Test.stopTest();

		leadList = [Select Id, Name, LeadSource
					From Lead
					Where LeadSource = 'Dreamforce'];
		System.assertEquals(leadList.size(), 200);
	}
	
}