Feature: create generator for CSR portal

Scenario: Generate valid token with CSR supervisor user

Given url "https://tek-insurance-api.azurewebsites.net"
 Scenario: Create New Account using Data Generator;
    * def generator = Java.type('tiger.api.test.data.DataGenerator')
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def dob = generator.getDob()
    Given path "/api/accounts/add-primary-account"
    And request
      """
      {

      "email": "string",
      "title": "string",
      "firstName": "string",
      "lastName": "string",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "string",
      "dateOfBirth": "string"
      }
      """
    And header Authorization = "Bearer" + generateToken
    When method post
    Then status 201
    * def generatedId = response.id
    And print generatedId
    And print response