@rest
Feature: Create lists of users with given input array

  Tests against PetStore user's POST endpoint to create users with array
  To run this feature use the following command:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.user.post.CreateArrayUsersIT -Denv=preprod

  Scenario: Creating users with an array of > 1 length
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithArray' with body
      """
        [
          {
            "username": "user01",
            "firstName": "string",
            "lastName": "string",
            "email": "string",
            "password": "user",
            "phone": "string",
            "userStatus": 0
          },
          {
            "username": "user02",
            "firstName": "string",
            "lastName": "string",
            "email": "string",
            "password": "user",
            "phone": "string",
            "userStatus": 0
          }
        ]
      """
    Then the service response status must be '200'


  Scenario: Creating user with an array with length == 1
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithArray' with body
      """
        [
          {
            "username": "lonelyUser",
            "firstName": "string",
            "lastName": "string",
            "email": "string",
            "password": "string",
            "phone": "string",
            "userStatus": 0
          }
        ]
      """
    Then the service response status must be '200'


  Scenario: Creating the same user twice
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithArray' with body
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
    When I send a 'POST' request to '/user/createWithArray' with body
      """
        [
          {
            "firstName": "string",
            "lastName": "string",
            "email": "string",
            "phone": "string",
            "userStatus": 0
          }
        ]
      """
    Then the service response status must be '400'


  Scenario: Creating user with made up fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithArray' with body
      """
        [
          {
            "username": "pikachu",
            "firstName": "Pika",
            "lastName": "Chu",
            "email": "string",
            "password": "ash",
            "phone": "string",
            "userStatus": 0,
            "country": "Sinnoh"
          }
        ]
      """
    Then the service response status must be '400'


  Scenario: Creating user with empty body
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/createWithArray' with body
      """
        []
      """
    Then the service response status must be '400'