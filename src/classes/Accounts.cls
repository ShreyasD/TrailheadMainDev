/**
 * See https://github.com/financialforcedev/fflib-apex-common for more info
 *
 * Install library via 
 *   https://githubsfdeploy.herokuapp.com/app/githubdeploy/financialforcedev/fflib-apex-common
 */

/**
 * Encapsulates all behaviour logic relating to the Account object
 * 
 * For more guidelines and details see 
 *   https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Domain_Layer
 *
 **/
public class Accounts extends fflib_SObjectDomain 
{
	public Accounts(List<Account> records) 
	{
		super(records);	
	}

	public override void onApplyDefaults() {
		for(Account acc : (List<Account>) Records) {
			acc.Description = 'Domain classes rock!';
		}
	}

	public override void onBeforeUpdate(Map<Id,SObject> existingRecords) {
		for(Account acc : (List<Account>) Records) {
			acc.AnnualRevenue = ((Account) existingRecords.get(acc.Id)).Description.getLevenshteinDistance(acc.Description);
		}
	}

	public class Constructor implements fflib_SObjectDomain.IConstructable2
	{
		public fflib_SObjectDomain construct(List<SObject> sObjectList)
		{
			return new Accounts(sObjectList);
		}

		public fflib_SObjectDomain construct(List<SObject> sObjectList, SObjectType sObjectType)
		{
			return new Accounts(sObjectList);
		}			
	}	
}