@isTest
private class MySimpleClassTest {
    @isTest static void testGreetingMorningAndEvening() {
        System.assertEquals('Good morning', MySimpleClass.getGreeting(true), 'Expected morning greeting');
        System.assertEquals('Good evening', MySimpleClass.getGreeting(false), 'Expected evening greeting');
    }

    @isTest static void testFindUsersByUsername() {
        // Create a test user to use for runAs
        User testUser = new User(
            FirstName = 'Test',
            LastName = 'User',
            Email = 'testuser@example.com',
            Username = 'testuser@example.com.test',
            Alias = 'tuser',
            TimeZoneSidKey = 'America/Los_Angeles',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            ProfileId = UserInfo.getProfileId(),
            LanguageLocaleKey = 'en_US'
        );
        insert testUser;

        System.runAs(testUser) {
            List<User> foundUsers = MySimpleClass.findUsersByUsername(testUser.Username);
            System.assertEquals(1, foundUsers.size(), 'Should find exactly one user');
            System.assertEquals(testUser.Id, foundUsers[0].Id, 'Returned user ID should match inserted user');
        }
    }
}