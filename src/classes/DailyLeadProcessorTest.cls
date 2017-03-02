@isTest
private class DailyLeadProcessorTest {

	// Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
	
	@testsetup
	static void setup() {
		List<Lead> leadList = new List<Lead>();
		for(Integer i=0; i < 200; i++) {
			leadList.add(new Lead(
				FirstName = 'Test',
				LastName = 'Lead' + i,
				Company = 'Test Company'
				));
		}
		insert leadList;
	}
	
	@isTest static void testSchedulable() {

		Map<Id, Lead> leadMap = new Map<Id, Lead>([Select Id, Name
							   	  					From Lead]);
		List<Id> leadIdList = new List<Id>(leadMap.keySet());
		
		Test.startTest();
			 // Schedule the test job
	        String jobId = System.schedule('ScheduledApexTest',
	            CRON_EXP, 
	            new DailyLeadProcessor());         
	        // Verify the scheduled job has not run yet.
	        List<Task> lt = [SELECT Id 
	            			 FROM Task 
	            			 WHERE WhatId IN :leadIdList];
	        System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
	        // Stopping the test will run the job synchronously
		Test.stopTest();

		List<Lead> leadList = [Select Id, Name, LeadSource
							   From Lead
							   Where LeadSource = 'Dreamforce'];
		System.assertEquals(leadList.size(), 200);
	}
	
}