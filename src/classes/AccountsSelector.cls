/**
 * See https://github.com/financialforcedev/fflib-apex-common for more info
 *
 * Install library via 
 *   https://githubsfdeploy.herokuapp.com/app/githubdeploy/financialforcedev/fflib-apex-common
 */

/**
 * Class encapsulates query logic for Account
 *
 * https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Selector_Layer
 **/
public class AccountsSelector extends fflib_SObjectSelector
{
	public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
				Account.Id,
				Account.Name,
				Account.Description,
				Account.AnnualRevenue
			};
	}

	public Schema.SObjectType getSObjectType()
	{
		return Account.sObjectType;
	}

	public List<Account> selectById(Set<ID> idSet)
	{
		return (List<Account>) selectSObjectsById(idSet);
	}	

	/*
	 * For more examples see https://github.com/financialforcedev/fflib-apex-common-samplecode
	 * 
	public List<Account> selectBySomethingElse(List<String> somethings)
	{
		assertIsAccessible();
		return (List<Account>) Database.query(
				String.format(
				'select {0}, ' +
				  'from {1} ' +
				  'where Something__c in :somethings ' + 
				  'order by {2}',
				new List<String> {
					getFieldListString(),
					getSObjectName(),
					getOrderBy() } ) );
	}
	 */
}