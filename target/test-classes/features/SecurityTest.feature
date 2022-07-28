@Smoke
Feature: Security test. Token Generation test

  Scenario: generate token with valid username and password.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    
   Scenario:  Test API Endpoint
   
    Given url "https://tek-insurance-api.azurewebsites.net/"
    And path "/api/token"
    And request {"username": "supervisorr","password": "tek_supervisor"}
    When method post
    Then status 404
    And print response

    Scenario: generate token with invalid username and valid password.
    Given url "https://tek-insurance-api.azurewebsites.net/"
    And path "/api/token"
    And request {"username": "invalid_user","password": "tek_supervisor"}
    When method post
    Then status 404
    And print response 
    * def errorMessage = response .errorMessage
    And assert errorMessage == "USER_NOT_FOUND"
    
    #3) Test API Endpiont "/api/token" with valid Username and invalid password.
    # status code should be 400.
    # Response with "errorMessage": "Password Not Matched". Take screen shot and share. 
    # Note: there is defect for this scenerio already open. 
    
    
    Scenario: generate token with invalid username and valid password.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "invalidpassword"}
    When method post
    Then status 400
    And print response 
    * def errorMessage = response.errorMessage
    And assert errorMessage == "Password Not Matched"
    
    
   
    