@rest
Feature: Place and order for a pet
  This feature tests against PetStroe store's endpoint for using POST request and creating orders.
  In order to run this feature is the following command:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.store.post.PlaceOrderPetIT -Denv=preprod

  Scenario: Creating a valid order
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/store/order' with body
      """
        {
          "petId": 2,
          "quantity": 1,
          "shipDate": "2022-03-23T10:57:44.606Z",
          "status": "placed",
          "complete": true
        }
      """
    Then the service response status must be '200'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
      | $.petId | equal | 2 |

  Scenario: Creating a valid order with nonexistent pet id
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/store/order' with body
      """
        {
          "petId": 99999999999999999,
          "quantity": 1,
          "shipDate": "2022-03-23T10:57:44.606Z",
          "status": "placed",
          "complete": true
        }
      """
    Then the service response status must be '404'


  Scenario: Creating an order with fields but without petId
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/store/order' with body
      """
        {
          "quantity": 5,
          "shipDate": "2022-03-23T10:57:44.606Z",
          "status": "approved",
          "complete": false
        }
      """
    Then the service response status must be '400'

  Scenario: Creating order with non-valid formats
    Given I securely send requests to '${envProperties:petStore.url}'
    And I send a 'POST' request to '/store/order' with body
      """
        {
          "petId": 2,
          "quantity": 2.321,
          "shipDate": "saturday",
          "status": "yes",
          "complete": "no"
        }
      """
    Then the service response status must be '400'

  Scenario: Creating order with empty body
    Given I securely send requests to '${envProperties:petStore.url}'
    And I send a 'POST' request to '/store/order' with body
      """
        {}
      """
    Then the service response status must be '400'