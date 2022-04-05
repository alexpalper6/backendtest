@rest
Feature: Add a new pet to the store
  This feature tests PetStore's endpoint for adding new pets giving a json as the body's data to introduce
  To run this feature use the followin line:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.pet.post.AddPetIT -Denv=preprod

  Scenario Outline: Adding a pet with given data
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
          "status": "<petStatus>"
        }
      """
    Then the service response status must be '<statusResponse>'

    Examples:
      | petStatus | statusResponse |
      | pending   | 200            |
      | happy     | 400            |


  Scenario: Adding pet with made-up fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet' with body
      """
        {
          "category": {
            "name": "category3"
          },
          "tags": [
            {
              "name": "Tag2"
            }
          ],
          "status": "pending"
        }
      """
    Then the service response status must be '400'


  Scenario: Adding pet with no fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet' with body
      """
       {
       }
      """
    Then the service response status must be '400'


