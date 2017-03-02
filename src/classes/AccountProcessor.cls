global class AccountProcessor {
	
	@future
	public static void countContacts(List<Id> accountIDs) {
		Map<String, Integer> contactCountMap = new Map<String, Integer>();

		AggregateResult[] groupedResults = 	[Select AccountId, Count(Id)
											 From Contact 
											 Where AccountId In :accountIDs
											 Group By AccountId];
		for(AggregateResult ar : groupedResults) {
			System.debug('AccountId: ' + ar.get('AccountId') + ' contactCOunt: ' + ar.get('expr0'));
			contactCountMap.put((String) ar.get('AccountId'), (Integer) ar.get('expr0'));
		}

		List<Account> accountsToUpdate = [Select Id, Name, Number_of_Contacts__c
										  From Account
										  Where Id =: contactCountMap.keySet()];
		for(Account acc : accountsToUpdate) {
			acc.Number_of_Contacts__c = contactCountMap.get(acc.Id);
		}
		update accountsToUpdate;
	}
}