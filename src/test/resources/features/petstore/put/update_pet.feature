@rest
Feature: Updates an existing pet

  This feature tests against PetStore's endpoint that is used to update a pet using a json as a body request.
  To run this feature use the following command:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.post.UpdatePetBodyIT -Denv=preprod

  Scenario: Updating a pet with valid fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet' with body
      """
        {
          "id": 1,
          "category": {
            "id": 0,
            "name": "string"
          },
          "name": "doggie",
          "photoUrls": [
            "string"
          ],
          "tags": [
            {
              "id": 0,
              "name": "string"
            }
          ],
          "status": "available"
        }
      """
    Then the service response status must be '200'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
      | $.id     | equal | 1          |
      | $.name   | equal | doggie     |
      | $.status | equal | available  |


  Scenario: Updating only one pet's field
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet' with body
      """
        {
          "id": 1,
          "name": "ddoms"
        }
      """
    Then the service response status must be '200'
    And I save element '$' in environment variable 'response'
    Then 'response' matches the following cases:
      | $.id        | equal  | 1     |
      | $.category  | exists |       |
      | $.name      | equal  | ddoms |
      | $.photoUrls | exists |       |
      | $.tags      | exists |       |
      | $.status    | exists |       |


  Scenario: Updating nonexistent pet
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet' with body
      """
        {
          "id": 6222,
          "category": {
            "id": 2,
            "name": "string"
          },
          "name": "doggie",
          "photoUrls": [
            "string"
          ],
          "tags": [
            {
              "name": "string"
            }
          ],
          "status": "available"
        }
      """
    Then the service response status must be '404'


  Scenario Outline: Updating pet with non-valid formats
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet' with body
      """
        {
          "id": <petId>,
          "category": {
            "id": 2,
            "name": "string"
          },
          "name": "shouldNotAppear",
          "photoUrls": [
            "string"
          ],
          "tags": [
            {
              "name": "string"
            }
          ],
          "status": "<petStatus>"
        }
      """
    Then the service response status must be '<statusResponse>'

    Examples:
    | petId | petStatus | statusResponse |
    | idOne | available | 400            |
    | 1     | happy     | 400            |
    | 1     | 222112    | 400            |


  Scenario: Updating pet with nonexistent fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet' with body
      """
        {
          "id": 1,
          "category": {
            "id": 2,
            "name": "string"
          },
          "name": "doggie",
          "photoUrls": [
            "string"
          ],
          "tags": [
            {
              "name": "string"
            }
          ],
          "status": "available"
        },
        "house": "323213131211",
        "number": 93292
      """
    Then the service response status must be '400'


  Scenario: Updating pet without pet id
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet' with body
      """
        {
          "category": {
            "id": 2,
            "name": "string"
          },
          "name": "doggie",
          "photoUrls": [
            "string"
          ],
          "tags": [
            {
              "name": "string"
            }
          ],
          "status": "available"
        },
      """
    Then the service response status must be '400'

    
  Scenario: Updating pet without fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet' with body
      """
        {}
      """
    Then the service response status must be '400'