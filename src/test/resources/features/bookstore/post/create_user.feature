@rest
Feature: Create users

  This feature will test BookStore's endpoint to create users.
  Passwords must have at least one non alphanumeric character, one digit ('0'-'9'), one uppercase ('A'-'Z'),
  one lowercase ('a'-'z'), one special character and Password must be eight characters or longer.

  To run this feature, use the following command:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.bookstore.post.CreateUserIT -Denv=preprod

  Scenario: Creates user
    Given I securely send requests to '${envProperties:bookStore.url}'
    When I send a 'POST' request to '/Account/v1/User' based on 'schemas/bookstore/creationTestData.json' as 'json' with:
      | $.userName | UPDATE | usuario08 |
    #When creating the user, the response code must be stored, UserID is needed for future tests
    Then I save element '$.userID' in environment variable 'USER_ID'
    And I create file 'createdUserTest.json' based on 'schemas/bookstore/userResultSchema.json' as 'json' with:
      | $.userID | UPDATE | ${USER_ID} |
