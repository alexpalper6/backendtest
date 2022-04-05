@rest
  Feature: Get user by username

    Tests against PetStore user's GET endpoint using the username.
    You can run this feature with the following line:
    mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.user.get.GetUserByUsernameIT -Denv=preprod

  Scenario Outline: Get user by given username
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'GET' request to '/user/<username>'
    Then the service response status must be '<responseStatus>'

    Examples:
      | username  | responseStatus |
      | user1     | 200            |
      | n         | 200            |
      | us$$##21~ | 404            |
      |           | 405            |