@rest
  Feature: Add a new pet to the store
    This feature tests PetStore's endpoint for adding new pets giving a json as the body's data to introduce
    To run this feature use the followin line:
    mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.post.AddPetIT -Denv=preprod

  Scenario: Adding a pet with valid data
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet' with body
      """
        {
          "category": {
            "name": 2
          },
          "name": "Jalato",
          "photoUrls": [
              "$||||#####"
          ],
          "tags": [
            {
              "name": "Magic sheep"
            }
          ],
          "status": "happy"
        }
      """
    Then the service response status must be '200'