Feature: Create an account and add address to the account

  Background: Create new Account.
    Given url "https://tek-insurance-api.azurewebsites.net/"
    * def creatAccountResulte = callonce read ('CreateAccountFeature.feature')
    And print createAccountResult
      * def primarypersonId = createAccountResult.response.id
    * def token = createAccountResult.result.response.token

  @Regression
  Scenario: Add address to an account
    Given path '/api/accounts/add-account-address'
    Given param primaryPersonId = primarypersonId
    Given header Autherization = "Bearer " + token
    Given request
      """
              {
      "addressType": "Home",
        "addressLine1": "22 Amgirl Dr",
        "city": "Colonie",
        "state": "NY",
        "postalCode": "12205",
        "countryCode": "1",
        "current": true
      }
      """
