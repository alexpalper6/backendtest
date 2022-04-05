@rest
Feature: Find purchase order by ID

  This feature tests against PetStroe store's endpoint for finding purchases by its ID using GET request.
  In order to run this feature use the following line:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.store.get.GetOrderByIdIT -Denv=preprod

  Scenario Outline: Getting a pet given its id
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'GET' request to '/store/order/<id>'
    Then the service response status must be '<responseStatus>'
    And the service response must contain the text '<textToAppear>'

    Examples:
      | id            | responseStatus | textToAppear |
      | 2             | 200            | id           |
      | 9999999999999 | 404            | 404          |
      | -32           | 400            | 400          |
      | Ten           | 400            | 400          |
      |               | 405            | unknown      |
