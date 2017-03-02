public class AddPrimaryContact implements Queueable {

	private Contact primaryContact;
	private String stateAbbreviation;

	public AddPrimaryContact (Contact primaryContact, String stateAbbreviation) {
		this.primaryContact = primaryContact;
		this.stateAbbreviation = stateAbbreviation;
	}

	public void execute(QueueableContext context) {
		List<Contact> contactsToInsert = new List<Contact>();
		for(Account acc : [Select Id, Name, BillingState
						   From Account
						   Where BillingState =: this.stateAbbreviation]) {
			Contact newContact = primaryContact.clone(false, true, false, false);
			newContact.AccountId = acc.Id;
			contactsToInsert.add(newContact);
		}
		insert contactsToInsert;
	}
}