Feature: Updates pet's data using url parameters

  This feature tests PetStore's endpoint for updating pet data, the pet to update will be identified by its id on
  endpoint's path.
  To run this feature use the followin line:
  mvn verify -Dit.test=app.teralco.testing.backendtest.runners.petstore.post.UpdatePetPathITDeletePetIT -Denv=preprod

  Scenario Outline: Updating pet data given keys and values

    Examples: