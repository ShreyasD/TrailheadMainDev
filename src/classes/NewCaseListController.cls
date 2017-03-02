public with sharing class NewCaseListController {
	public NewCaseListController() {
		
	}

	public List<Case> getNewCases() {
		return [Select Id, CaseNumber
				From Case
				Where Status = 'New'];
	}
}