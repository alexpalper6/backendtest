@rest
Feature: Deletes a pet

  This features test against the PetStore's endpoint to delete pets with its id.
  To run this use:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.pet.delete.DeletePetIT -Denv=preprod

  Scenario Outline: Deleting pet given an id
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'DELETE' request to '/pet/<id>'
    Then the service response status must be '<status>'
    And I send a 'GET' request to '/pet/<id>'
    Then the service response status must be '<responseCode>'

    Examples:
    | id         | status | responseCode |
    | 1          | 200    | 404          |
    | 9999999999 | 404    | 404          |
    | -1         | 400    | 400          |
    | one        | 400    | 400          |
    |            | 405    | 405          |

  Scenario: Deleting a pet without id
    Given I securely send requests to '${envProperties:server.url}'
    When I send a 'DELETE' request to '/pet'
    Then the service response status must be '405'