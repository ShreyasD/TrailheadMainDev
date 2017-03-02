global class CaseService {
    global static void closeCases(Set<Id> caseIds, String closeReason) {
        Map<Id, Case> caseToCloseMap = new Map<Id, Case>([Select Id, Reason
                                                          From Case
                                                          Where Id In :caseIds]);
        for(Case c : caseToCloseMap.values()) {
            c.Status = 'Closed';
            c.Reason = closeReason;
        }
        
        update caseToCloseMap.values();
    }
}