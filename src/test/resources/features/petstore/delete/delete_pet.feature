@rest
Feature: Deletes a pet

  This features test against the PetStore's endpoint to delete pets with its id.
  To run this use:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.delete.DeletePetIT -Denv=preprod

  Scenario Outline: Deleting pet given an id
    Given I securely send requests to '${envProperties:server.url}'
    When I send a 'DELETE' request to '/pet/<id>'
    Then the service response status must be '<status>'

    Examples:
    | id         | status |
    | 1          | 200    |
    | 9999999999 | 404    |
    | -1         | 400    |
    | one        | 400    |
    |            | 405    |

  Scenario: Deleting a pet without id
    Given I securely send requests to '${envProperties:server.url}'
    When I send a 'DELETE' request to '/pet'
    Then the service response status must be '405'