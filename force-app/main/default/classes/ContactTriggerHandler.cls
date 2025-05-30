public class ContactTriggerHandler {
    public static void updateAccountContactCount(Map<Id,Contact>consmap,Map<Id,Contact>newmap) {
       Set<Id>accids=new Set<Id>(); 
        if(consmap!=null){
            for(Contact con:consmap.values()){
                if(con.AccountId!=null){
                  accids.add(con.AccountId);  
                }
            }
        }
        if(newmap!=null){
            for(Contact con:newmap.values()){
                if(con.AccountId!=null){
                    accids.add(con.AccountId);
                }
            }
        }
        Map<Id,Account>updateToAcc=new Map<Id,Account>();
        for(Account acc:[select id,(select id from contacts)from Account where id in:accids]){
            acc.Total__c=acc.contacts.size();
            updateToAcc.put(acc.id,acc);
        }
        if(!updateToAcc.isempty()){
            update updateToAcc.values();
        }
    }
}