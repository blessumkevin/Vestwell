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
        System.assertEquals('123 Main St', acc.BillingStreet, 'Default BillingStreet is 123 Main St');
        System.assertEquals('CA', acc.BillingState, 'Default BillingState is CA');
        System.assertEquals('90210', acc.BillingPostalCode, 'Default BillingPostalCode is 90210');
        System.assertEquals('USA', acc.BillingCountry, 'Default BillingCountry is USA');
    }

    @isTest static void testDefaultShippingAddress() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountAutomations.setDefaultShippingAddress(acc);
        System.assertEquals('123 Main St', acc.ShippingStreet, 'Default ShippingStreet is 123 Main St');
        System.assertEquals('CA', acc.ShippingState, 'Default ShippingState is CA');
        System.assertEquals('90210', acc.ShippingPostalCode, 'Default ShippingPostalCode is 90210');
        System.assertEquals('USA', acc.ShippingCountry, 'Default ShippingCountry is USA');
    }

    @isTest static void testDefaultPhone() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountAutomations.setDefaultPhone(acc);
        System.assertEquals('5555555555', acc.Phone, 'Default phone number is 5555555555');
    }

    @isTest static void testDefaultURL() {
        Account acc = new Account(Name = 'My Test Account');
        insert acc;
        acc = AccountAutomations.setDefaultURL(acc);
        System.assertEquals('www.copa.do', acc.Website, 'Default website is www.copa.do');
    }
}