@rest
Feature: Deleting existent user

  Testing PetsStore user DELETE endpoint
  To run this feature you may use this command:
  mvn verify -Dit.test=app.teralco.testing.backendtest.features.petstore.user.delete.DeleteUserIT -Denv=preprod

  Scenario Outline: Deleting user with given param
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'DELETE' request to /user/<username>
    Then the service response status must be '<statusResponse>'

    Examples:
      | username | statusResponse |
      | user1    | 200            |
      | userabc1 | 404            |
      |          | 405            |