trigger ClosedOpportunityTrigger on Opportunity (after insert,after update) {
OpportunityTriggerHandler.CreateTaskOnOppo(Trigger.new);
}