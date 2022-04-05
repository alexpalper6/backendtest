@rest
  Feature: Delete purchase order by ID

    This feature tests against PetStore store's endpoint for deleting pet with given id.
    In order to run this feature please use the following command:
    mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.store.delete.DeleteOrderByIdIT -Denv=preprod

  Scenario Outline: Deleting order by given id
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'DELETE' request to '/store/order/<id>'
    Then the service response status must be '<responseStatus>'

    Examples:
      | id                | responseStatus |
      | 2                 | 200            |
      | 99999999999999999 | 404            |
      | -321              | 400            |
      | fourteen          | 400            |
      |                   | 405            |