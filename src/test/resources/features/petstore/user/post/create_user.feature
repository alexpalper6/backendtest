@rest
Feature: Create user

  This feature tests against PetStore user's endpoint POST
  You can run this feature with the following line:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.user.post.CreateUserIT -Denv=preprod


  Scenario: Creating user with valid fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user' with body
      """
        {
          "username": "TestsInANutshell",
          "firstName": "Name123",
          "lastName": "Lastname321",
          "email": "test@test.com",
          "password": "test123",
          "phone": "string",
          "userStatus": 0
        }
      """
    Then the service response status must be '200'


  Scenario: Creating user without username
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user' with body
      """
        {
          "firstName": "Name123",
          "lastName": "Lastname321",
          "email": "test@test.com",
          "password": "testNoUser",
          "phone": "string",
          "userStatus": 0
        }
      """
    Then the service response status must be '400'


  Scenario: Creating user without password
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user' with body
      """
        {
          "username": "TestNoPasswd",
          "firstName": "Name123",
          "lastName": "Lastname321",
          "email": "test@test.com",
          "phone": "string",
          "userStatus": 0
        }
      """
    Then the service response status must be '400'


  Scenario: Creating user without username and password
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user' with body
      """
        {
          "firstName": "Name123",
          "lastName": "Lastname321",
          "email": "test@test.com",
          "phone": "string",
          "userStatus": 0
        }
      """
    Then the service response status must be '400'


  Scenario: Creating user with nonexistent fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user' with body
      """
        {
          "username": "RandomField",
          "firstName": "Ns",
          "lastName": "NameString",
          "email": "test@test.com",
          "password": "te2213",
          "phone": "string",
          "userStatus": 0,
          "addres": "home"
        }
      """
    Then the service response status must be '400'


  Scenario: Creating username with empty body
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user' with body
      """
        {}
      """
    Then the service response status must be '400'