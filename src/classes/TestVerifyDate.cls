@isTest
private class TestVerifyDate {
	
	@isTest static void testAllScenarios() {
		Date date1 = Date.today();
		Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);

		//Date2 before
		Date date2 = date1.addDays(-5);
		System.assertEquals(VerifyDate.CheckDates(date1, date2), lastDay);

		//Date2 within 30 days
		date2 = date1.addDays(5);
		System.assertEquals(VerifyDate.CheckDates(date1, date2), date2);

		//Date2 after 30 days
		date2 = date1.addDays(35);
		System.assertEquals(VerifyDate.CheckDates(date1, date2), lastDay);
	}
	
}