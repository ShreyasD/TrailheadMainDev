@isTest
private class UnitOfWorkTest {
    testmethod static void challangeComplete() {
        // Create a Unit Of Work
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[] {
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );
        
        for(Integer i=0; i < 100; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i;
            uow.registerNew(acc);
            
            for(Integer j=0; j < 5; j++) {
                Contact cnt = new Contact();
                cnt.firstname = 'Test';
                cnt.lastname = 'Contact ' + (i*j);
                uow.registerNew(cnt, Contact.AccountId, acc);
                
                Note n = new Note();
                n.Title = 'Test Note';
                uow.registerNew(n, Note.ParentId, cnt);
            }
        }
        
        uow.commitWork();
        
        System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Note].size());
    }
}