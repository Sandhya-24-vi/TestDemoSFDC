public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String name) {
        return [SELECT Id, Name FROM Contact WHERE Name LIKE :('%' + name + '%') LIMIT 20];
    }

    @AuraEnabled
    public static void updateContact(Contact contactToUpdate) {
        update contactToUpdate;
    }

    @AuraEnabled
    public static void deleteContact(Id contactId) {
        delete [SELECT Id FROM Contact WHERE Id = :contactId];
    }
}