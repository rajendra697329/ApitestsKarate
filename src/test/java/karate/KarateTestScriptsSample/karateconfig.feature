@tag
Feature: configure karate config file
  I want to use this template for my feature file

  @tag1
  Scenario: Fetching student data using path params
    Given url baseUrl
    And path resource_path + rNo
    When method GET
    Then status 200
    * print response
    And match response.body contains '102'
