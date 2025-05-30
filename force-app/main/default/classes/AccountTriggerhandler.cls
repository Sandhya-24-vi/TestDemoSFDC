public class AccountTriggerhandler {
    public static void ShipCodeOnBillCode(List<Account>acclist){
        for(Account acc:acclist){
            if(acc.Match_Billing_Address__c==true){
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
        }
    }
    public static void UpdateConOwnerOnAcc(List<Account>acclist,Map<id,Account>accmap){
        set<id>accids=new set<id>();
        
        List<Contact>conListToUpdate =new List<Contact>();
        for(Account acc:acclist){
            if(acc.OwnerId!=null && acc.OwnerId!=accmap.get(acc.id).OwnerId){
                accids.add(acc.id);
            } 
        }
     
        for(Contact con: [SELECT Id, AccountId, OwnerId FROM Contact WHERE AccountId IN :accIds]){
            Account updatedAcc = accmap.get(con.AccountId);
            if (updatedAcc != null && updatedAcc.OwnerId != con.OwnerId) {
                con.OwnerId = updatedAcc.OwnerId;
                conListToUpdate.add(con);
            }
        
        }
        
           
        
           
    }
}