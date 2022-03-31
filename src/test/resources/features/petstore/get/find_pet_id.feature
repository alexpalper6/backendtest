@rest
Feature: Find Pet by its ID

  This feature tests against PetStore's GET request for finding pets with a specific id.
  You can run this test writing in your terminal: mvn verify -Dit.test=app.teralco.testing.backendtest.runners.FindPetIdIT

  Scenario: Get pet data with valid Id
    Given I securely send requests to 'petstore.swagger.io/v2/'
    When I send a 'GET' request to '/pet/' with body '2'
    Then the service response status must be '200'
