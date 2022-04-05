@rest
Feature: Logs out current logged in user section

  Tests against PetStore user's GET endpoint
  You can run this feature with the following line:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.user.get.LogOutSystemIT -Denv=preprod

  Scenario: Logging out with default url
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'GET' request to '/user/logout'
    Then the service response status must be '200'


  Scenario: Logging out with parameters
    Given I securely send requests to '${envProperties:petStore.url}'
    And I set url parameters:
      | username | user1 |
      | password | user1 |
    When I send a 'GET' request to '/user/logout'
    Then the service response status must be '400'
