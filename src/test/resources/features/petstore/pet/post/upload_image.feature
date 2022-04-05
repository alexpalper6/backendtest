@rest
Feature: Uploads an Image

  This feature tests against PetStore's endpoint that is used to upload an image on a pet.
  To run this feature use the following command:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.pet.post.UploadImageIT -Denv=preprod

  Scenario Outline: Upload an image on a pet with given id and image
    Given I securely send requests to '${envProperties:petStore.url}'
    Given I set headers:
      | Content-Type | multipart/form-data |
    And I add the file in 'schemas/testImage.jpg' to the request
    When I send a '<requestType>' request to '/pet/<id>/uploadImage'
    Then the service response status must be '<responseStatus>'

    Examples:
      | id        | requestType | responseStatus |
      | 2         | POST        | 200            |
      | 999999999 | POST        | 404            |
      | -100      | POST        | 400            |
      | two       | POST        | 400            |
      | 2         | PUT         | 405            |


  Scenario: Uploading without image
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet/2/uploadImage'
    Then the service response status must be '400'

  Scenario: Uploading a json instead of an image
    Given I securely send requests to '${envProperties:petStore.url}'
    When I send a 'POST' request to '/pet/2/uploadImage' based on 'schemas/mytestdata.json' as 'json'
    Then the service response status must be '415'