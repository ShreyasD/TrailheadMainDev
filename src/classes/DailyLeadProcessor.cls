global class DailyLeadProcessor implements Schedulable {
	global void execute(SchedulableContext sc) {
		List<Lead> leadList = [Select Id, Name, LeadSource
							   From Lead
							   Where LeadSource = null
							   Limit 200];
		for(Lead ld : leadList) {
			ld.LeadSource = 'Dreamforce';
		}
		update leadList;
	}
}