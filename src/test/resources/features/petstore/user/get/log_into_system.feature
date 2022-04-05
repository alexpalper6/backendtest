@rest
Feature: Logs user into the system

  Tests against PetStore user's GET endpoint using username and password as url parameters.
  You can run this feature with the following line:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.user.get.LogIntoSystemIT -Denv=preprod

  Scenario Outline: Trying to log in with given username and password
    Given I securely send requests to '${envProperties:petStore.url}'
    And I set url parameters:
      | username | <username> |
      | password | <password> |
    When I send a 'GET' request to '/user/login'
    Then the service response status must be '<responseStatus>'

    Examples:
      | username         | password | responseStatus |
      | user1            | user1    | 200            |
      | user1            | waasda   | 401            |
      | EpicBroadBand787 | 123      | 401            |


  Scenario: Trying to log without password
    Given I securely send requests to '${envProperties:petStore.url}'
    And I set url parameters:
      | username | user1 |
    When I send a 'GET' request to '/user/login'
    Then the service response status must be '400'

  Scenario: Trying to log with made up key and value
    Given I securely send requests to '${envProperties:petStore.url}'
    And I set url parameters:
      | address | this |
    When I send a 'GET' request to '/user/login'
    Then the service response status must be '400'

    Scenario: Login without parameters
      Given I securely send requests to '${envProperties:petStore.url}'
      When I send a 'GET' request to '/user/login'
      Then the service response status must be '405'