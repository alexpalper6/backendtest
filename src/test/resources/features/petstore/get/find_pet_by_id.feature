@rest
Feature: Find Pet by its ID

  This feature tests against PetStore's GET request for finding pets with a specific id.
  You can run this test writing in your terminal:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.get.FindPetByIdIT -Denv=preprod

  Scenario: Getting pet with existent id
    Given I securely send requests to '${envProperties:server.url}'
    When I send a 'GET' request to '/pet/2'
    Then the service response status must be '200'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
      | $.id | equal | 2 |

  Scenario Outline: Getting pet with failing ids
    Given I securely send requests to '${envProperties:server.url}'
    When I send a 'GET' request to '/post/<id>'
    Then the service response status must be '<status>'

    Examples:
      | id         | status |
      | 9999999999 | 404    |
      | -1         | 400    |
      | gato       | 400    |