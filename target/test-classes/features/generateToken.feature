Feature: Practice add new account 


  Background: Oepn and validet tek insurance website
  	Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read ('GenerateToken.feature')
    * def generateToken = result.response.token
    And header Authorization = "Bearer " + generateToken

  Scenario: Create New Account using Data Generator;
    * def connector = Java.type('tiger.api.test.fake.FakeData')
    * def email = connector.getEmail()
    * def name = connector.getFirstName()
    * def lastName = connector.getLastName()
    * def DOB = connector.getDOB()
    Given path "/api/accounts/add-primary-account"
    And request
    
      """
      {
      "id";
      "email": "string",
      "firstName": "#(name)",
      "lastName": "#(lastname)",
      "title": "#Mrs",
      "gender": "FEMALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "empolyed",
      "dateOfBirth": "(DOB)",
      "new": true
      }
      """
    
   