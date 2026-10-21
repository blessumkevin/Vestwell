public with sharing class MySimpleClass {
    public static String getGreeting(Boolean isMorning) {
        if (isMorning) {
            return 'Good morning';
        } else {
            return 'Good evening';
        }
    }

    public static List<User> findUsersByUsername(String username) {
        // Check CRUD access
        if (Schema.sObjectType.User.isAccessible() && Schema.sObjectType.User.fields.Username.isAccessible()) {
            return [SELECT Id FROM User WHERE Username = :username];
        } else {
            // If not accessible, return an empty list or handle as appropriate
            return new List<User>();
        }
    }
}