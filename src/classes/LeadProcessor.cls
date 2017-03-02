global class LeadProcessor implements Database.Batchable<sObject> {
	
	String query;
	
	global LeadProcessor() {
		query = 'SELECT Id, Name, LeadSource ' +
				'FROM Lead';
	}
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		System.debug(BC.getChildJobId() + ' batch starting ...');
		return Database.getQueryLocator(query);
	}

   	global void execute(Database.BatchableContext BC, List<sObject> scope) {
   		System.debug(BC.getChildJobId() + ' batch executing ...');

		List<Lead> leadList = (List<Lead>) scope;
		for(Lead l : leadList) {
			l.LeadSource = 'Dreamforce';
		}
		update leadList;
	}
	
	global void finish(Database.BatchableContext BC) {
		System.debug(BC.getChildJobId() + ' batch finished');
	}
	
}