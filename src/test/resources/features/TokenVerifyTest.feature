
Feature: Security test. verify token test 


 Scenario: Verify valid token. 
		Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
    Given path "/api/token/verify"
    And param username = "supervisor"
    And param token = generatedToken
    When method get
    Then status 200
    And print response
    
     
     # 2
     
    Scenario: Verify invalid token. 
    
#		
    #And path "/api/token"
    #And request {"username": "supervisor","password": "tek_supervisor"}
    #When method post
    #Then status 200
    #* def generatedToken = response.token
    
    Given url "https://tek-insurance-api.azurewebsites.net"
    Given path "/api/token/verify"
    And param username = "supervisor"
    And param token = "Wrong Token"
    When method get
    Then status 400
    And print response