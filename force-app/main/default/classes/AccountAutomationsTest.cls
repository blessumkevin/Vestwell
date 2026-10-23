@IsTest
private class AccountAutomationsTest {

    @isTest static void testDefaultDescription() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountAutomations.setDefaultDescription(acc);
        System.assertEquals('Default description', acc.Description, 'When description is null, it is updated to Default description');

        acc.Description = 'New Description Manual';
        acc = AccountAutomations.setDefaultDescription(acc);
        System.assertNotEquals('Default description', acc.Description, 'When description is NOT null, it is NOT updated to Default description');
    }

    @isTest static void testDefaultBillingAddress() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountAutomations.setDefaultBillingAddress(acc);
        System.assertEquals('456 W Madison St', acc.BillingStreet, 'Default BillingStreet is 456 W Madison St');
        System.assertEquals('IL', acc.BillingState, 'Default BillingState is IL');
        System.assertEquals('60661', acc.BillingPostalCode, 'Default BillingPostalCode is 60661');
        System.assertEquals('USA', acc.BillingCountry, 'Default BillingCountry is USA');
    }

    @isTest static void testDefaultShippingAddress() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountAutomations.setDefaultShippingAddress(acc);
        System.assertEquals('456 W Madison St', acc.ShippingStreet, 'Default ShippingStreet is 456 W Madison St');
        System.assertEquals('IL', acc.ShippingState, 'Default ShippingState is IL');
        System.assertEquals('60661', acc.ShippingPostalCode, 'Default ShippingPostalCode is 60661');
        System.assertEquals('USA', acc.ShippingCountry, 'Default ShippingCountry is USA');
    }

    @isTest static void testDefaultPhone() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountAutomations.setDefaultPhone(acc);
        System.assertEquals('9257868477', acc.Phone, 'Default phone number is 9257868477');
    }

    @isTest static void testDefaultURL() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountAutomations.setDefaultURL(acc);
        System.assertEquals('www.copado.com', acc.Website, 'Default website is www.copado.com');
    }
}