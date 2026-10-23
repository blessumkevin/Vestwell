/**
 * @description
 * Utility class for setting default values on Account records.
 */
public class AccountAutomations {
    
    /**
     * @description
     * Sets a default description on the Account if it is currently null.
     *
     * @param a The Account record to update.
     * @return The updated Account record.
     */
    public static Account setDefaultDescription(Account a) {
        if (a.Description != null) {
            return a;
        } else {
            a.Description = 'Default description';
            return a;
        }
    }
    
    /**
     * @description
     * Sets a default billing address on the Account.
     *
     * @param a The Account record to update.
     * @return The updated Account record.
     */
    public static Account setDefaultBillingAddress(Account a) {
        a.BillingStreet = '456 W Madison St'; 
        a.BillingState = 'IL'; 
        a.BillingPostalCode = '60661'; 
        a.BillingCountry = 'USA';
        return a;
    }
    
    /**
     * @description
     * Sets a default shipping address on the Account.
     *
     * @param a The Account record to update.
     * @return The updated Account record.
     */
    public static Account setDefaultShippingAddress(Account a) {
        a.ShippingStreet = '456 W Madison St'; 
        a.ShippingState = 'IL';
        a.ShippingPostalCode = '60661';
        a.ShippingCountry = 'USA';
        return a;
    }
    
    /**
     * @description
     * Sets a default phone number on the Account.
     *
     * @param a The Account record to update.
     * @return The updated Account record.
     */
    public static Account setDefaultPhone(Account a) {
        a.Phone = '9257868477';
        return a;
    }
    
    /**
     * @description
     * Sets a default website URL on the Account.
     *
     * @param a The Account record to update.
     * @return The updated Account record.
     */
    public static Account setDefaultURL(Account a) {
        a.Website = 'www.copado.com'; 
        return a;
    }
}