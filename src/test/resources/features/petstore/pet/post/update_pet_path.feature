@rest
Feature: Updates pet's data using url parameters

  This feature tests PetStore's endpoint for updating pet data, the pet to update will be identified by its id on
  endpoint's path.
  To run this feature use the followin line:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.post.UpdatePetPathIT -Denv=preprod

  Scenario Outline: Updating pet data with given key and value using its id
    Given I securely send requests to '${envProperties:petStore.url}'
    And I set url parameters:
      | <keyParam> | <valueParam> |
    When I send a 'POST' request to '/pet/<id>'
    Then the service response status must be '<responseCode>'
    Examples:
      | keyParam | valueParam | id          | responseCode |
      | name     | jack       | 2           | 200          |
      | name     | pineapple  | 99999999999 | 404          |
      | race     | bengali    | 67          | 400          |
      | name     | pot        | nine        | 400          |

  Scenario: Updating multiple pet data with given keys and values
    Given I securely send requests to '${envProperties:petStore.url}'
    And I set url parameters:
     | name   | potatoe   |
     | status | pending   |
    When I send a 'POST' request to '/pet/2'
    Then the service response status must be '200'