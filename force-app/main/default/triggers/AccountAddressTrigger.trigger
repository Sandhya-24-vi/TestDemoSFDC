trigger AccountAddressTrigger on Account (before update) {
//AccountTriggerhandler.ShipCodeOnBillCode(Trigger.new);
AccountTriggerhandler.UpdateConOwnerOnAcc(Trigger.new,Trigger.oldmap);
}