@rest
Feature: Find Pets by Status

  This feature tests against PetStore's GET request for finding pets with a given status.
  You can run this feature with the following line:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.pet.get.FindPetByStatusIT -Denv=preprod

  Scenario Outline: Trying to get a pet from given status from url param
    Given I securely send requests to '${envProperties:petStore.url}'
    And I set url parameters:
      | <keyParam> | <valueParam> |
    When I send a 'GET' request to '/pet/findByStatus'
    Then the service response status must be '<responseCode>'
    Then the service response must contain the text '<info>'

    Examples:
      | keyParam | valueParam        | responseCode  | info      |
      | status   | available         | 200           | available |
      | value    | available         | 400           | error     |
      | status   | 22                | 400           | error     |
      | status   | available,pending | 200           | status    |
      | status   | available,pending | 200           | pending   |
      | status   | available,123     | 400           | error     |