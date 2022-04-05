@rest
Feature: Create list of users with given input array

  Tests against PetStore user's POST endpoint to create users with list
  To run this feature use the following command:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.user.post.CreateArrayUsersIT -Denv=preprod

  Scenario: Creating users with an array of > 1 length
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithList' with body
      """
        [
          {
            "username": "ususario",
            "firstName": "nme",
            "lastName": "almendro",
            "email": "string",
            "password": "3441",
            "phone": "322 11 32 13",
            "userStatus": 0
          },
          {
            "username": "usser",
            "firstName": "string",
            "lastName": "string",
            "email": "string",
            "password": "usser",
            "phone": "string",
            "userStatus": 0
          }
        ]
      """
    Then the service response status must be '200'


  Scenario: Creating user with an array with length == 1
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithList' with body
      """
        [
          {
            "username": "1user",
            "firstName": "string",
            "lastName": "string",
            "email": "string",
            "password": "123456789",
            "phone": "string",
            "userStatus": 0
          }
        ]
      """
    Then the service response status must be '200'


  Scenario: Creating the same user twice
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithList' with body
      """
        [
          {
            "username": "multiUser",
            "firstName": "sameName",
            "lastName": "sameLastName",
            "email": "string",
            "password": "samePasswd",
            "phone": "string",
            "userStatus": 0
          },
          {
            "username": "multiUser",
            "firstName": "sameName",
            "lastName": "sameLastName",
            "email": "string",
            "password": "samePasswd",
            "phone": "string",
            "userStatus": 0
          }
        ]
      """
    Then the service response status must be '409'


  Scenario: Creating user with no username and password
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithList' with body
      """
        [
          {
            "firstName": "name",
            "lastName": "rock",
            "email": "string",
            "phone": "323 11 22 33",
            "userStatus": 1
          }
        ]
      """
    Then the service response status must be '400'


  Scenario: Creating user with made up fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithList' with body
      """
        [
          {
            "username": "1user",
            "firstName": "string",
            "lastName": "string",
            "email": "string",
            "password": "123456789",
            "phone": "string",
            "userStatus": 0,
            "country": "Spain"
          }
        ]
      """
    Then the service response status must be '400'


  Scenario: Creating user with empty body
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithList' with body
      """
        []
      """
    Then the service response status must be '400'