#2) Test API endpiont "/api/accounts/add-primary-account" to add new Account with Existing email address. 
# Then status code should be 400 – Bad Request ,  validate response.
# 3)Test API endpoint "/api/accounts/add-account-car" to add car to existing account.
# Then status code should be 201 – Create ,  validate response.
# 4)Test API endpoint "/api/accounts/add-account-phone" to add Phone number to existing account.
# Then status code should be 201 – Create ,  validate response.
# 5)Test API endpoint "/api/accounts/add-account-address" to add address to existing account.
# Then status code should be 201 – Create ,  validate response.
  
  Feature: Add new Account with exsiting email address
  
  Background: generate token for all scenarios.
  	Given url "https://tek-insurance.azurewebsites.net/"
  	And path "/api/token"
  	And request {"username": "supervisor","password": "tek_supervisor"}
  	When method post 
  	Then status 200
  	* def generateToken = response.token
  	And as assert response.primaryperson.email == "sediqa.ahmadi22@gmail.com"
  	
  	
  	Scenario: Add new Account with Existing email address
    Given path "/api/accounts/add-primary-account"
    And request {"email": "sediqa.ahmadi22@gmail.com","title": "Mrs.","firstName": "Sediqa","lastName": "Ahmadi","gender": "FEMALE","maritalStatus": "SINGLE","employmentStatus": "Employed","dateOfBirth": "03/05/1990"}
    And header Authorization = "Bearer " + generateToken
    When method post
    * def errorMessage = response.errorMessage
    And assert errorMessage == "Account with Email sediqa.ahmadi22@gmail.com is exist"
    And print response
    Then status 400
    And assert response.primaryPerson.email == "sediqa.ahmadi22@gmail.com"
  	
  	Scenario: Add car to an existing Account.
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = 7876
    And request {"id": 0,"primaryPerson": {"id": 7876,"email": "sediqa.ahmadi22@gmail.com","title": "Mrs.","firstName": "Sahar","lastName": "Ahmed","gender": "FEMALE","maritalStatus": "Single","employmentStatus": "Empulyed","dateOfBirth": "1990/03/0"},"make": "lamborghini","model": "Avandor","year": "2022","licensePlate":"2022"}
  	And Asser response.primaryPerson.email == "sediqa.ahmadi22@gmail.com"