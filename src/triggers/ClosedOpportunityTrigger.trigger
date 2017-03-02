trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> tasksToUpdate = new List<Task>();

	for(Opportunity opp : Trigger.new) {
		if(opp.StageName == 'Closed Won') {
			tasksToUpdate.add(new Task(
				Subject = 'Follow Up Test Task',
				WhatId = opp.Id));
		}
	}

	insert tasksToUpdate;
}