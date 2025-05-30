public class OpportunityTriggerHandler {
    public static void CreateTaskOnOppo(List<Opportunity> oppList) {
        List<Task> tasksToInsert = new List<Task>();

        for (Opportunity opp : oppList) {
            if (opp.StageName == 'Closed Won') {
                Task followUpTask = new Task(
                    OwnerId = opp.OwnerId,
                    Subject = 'Follow Up Test Task',
                    WhatId = opp.Id,
                    Status = 'Not Started',
                    Priority = 'Normal',
                    Description = 'Automatically created task for new opportunity.'
                );
                tasksToInsert.add(followUpTask);
            }
        }

        if (!tasksToInsert.isEmpty()) {
            insert tasksToInsert;
        }
    }
}