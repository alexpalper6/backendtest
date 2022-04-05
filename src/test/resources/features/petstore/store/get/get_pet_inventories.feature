@rest
Feature: Returns pet inventories by status

  This feature tests against PetStroe store's endpoint for finding every status in the inventory with the quantity
  of pets.
  In order to run this feature use the following line:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.store.get.GetPetInventoriesIT -Denv=preprod

  Scenario: Getting the inventories
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'GET' request to '/store/inventory'
    Then the service response status must be '200'