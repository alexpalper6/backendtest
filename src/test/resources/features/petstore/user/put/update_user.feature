@rest
Feature: Update user

  Tests PetStore user's PUT endpoint
  You can run this feature with the following line:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.user.put.UpdateUserIT -Denv=preprod

  Scenario: Updating existent user with all fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'PUT' request to '/user/user1' based on 'schemas/user_test_data.json' as 'json' with:
      | $.firstName | UPDATE | I_Changed_The_Name |
    Then the service response status must be '200'

  Scenario: After updating user, checking that values are changed
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'GET' request to '/user/user1'

    Then I save element '$' in environment variable 'response'
    And 'response' matches the following cases:
      | $.firstName | equal | I_Changed_The_Name |

  Scenario: Updating existent user with only 1 field
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'PUT' request to '/user/user1' based on 'schemas/user_test_data.json' as 'json' with:
      | $.username   | DELETE |        |
      | $.firstName  | DELETE |        |
      | $.lastName   | DELETE |        |
      | $.email      | DELETE |        |
      | $.password   | UPDATE | 321321 |
      | $.phone      | DELETE |        |
      | $.userStatus | DELETE |        |
    Then the service response status must be '200'

  Scenario: After updating user with 1 field, checking that fields are not overwritten
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'GET' request to '/user/user1'
    Then I save element '$' in environment variable 'response'
    And 'response' matches the following cases:
      | $.username   | exists |        |
      | $.firstName  | exists |        |
      | $.lastName   | exists |        |
      | $.email      | exists |        |
      | $.password   | equal  | 321321 |
      | $.phone      | exists |        |
      | $.userStatus | exists |        |


  Scenario: Updating nonexistent user
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'PUT' request to '/user/nonexistentuser' based on 'schemas/user_test_data.json' as 'json' with:
      | $.username | UPDATE | userDoesntExist |
    Then the service response status must be '404'

  Scenario: Updating user with nonexistent fields
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/user/user1' based on 'schemas/user_test_data.json' as 'json' with:
      | inventedKey | ADD | 123 |
    Then the service response status must be '400'

  Scenario: Updating user with empty body
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'PUT' request to '/user/user1' with body
      """
        {}
      """
    Then the service response status must be '400'