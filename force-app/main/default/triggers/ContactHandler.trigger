trigger ContactHandler on Contact (after insert,after update,after delete,after undelete) {
ContactTriggerHandler.updateAccountContactCount(Trigger.newmap,Trigger.oldmap);
}