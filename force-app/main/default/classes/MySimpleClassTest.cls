@isTest
private class MySimpleClassTest {

    /**
     * Builds a username that is unique across all Salesforce orgs.
     * Combines a fixed prefix, the current timestamp, a random number,
     * and the org Id, so repeated runs and other orgs never collide.
     */
    private static String buildUniqueUsername(String prefix) {
        String uniqueKey = String.valueOf(DateTime.now().getTime())
            + String.valueOf(Math.abs(Crypto.getRandomInteger()));
        return prefix + '.' + uniqueKey + '@' + UserInfo.getOrganizationId() + '.test.com';
    }

    @isTest static void testGreetingMorningAndEvening() {
        System.assertEquals('Good morning', MySimpleClass.getGreeting(true), 'Expected morning greeting');
        System.assertEquals('Good evening', MySimpleClass.getGreeting(false), 'Expected evening greeting');
    }

    @isTest static void testFindUsersByUsername() {
        // Create a test user with a guaranteed unique username
        User testUser = new User(
            FirstName = 'Test',
            LastName = 'User',
            Email = 'testuser@example.com',
            Username = buildUniqueUsername('testuser'),
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