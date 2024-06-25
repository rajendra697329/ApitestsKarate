Feature: Add patient

  Background: Add patients
    Given url 'http://10.82.180.36:8080/InfyClinicV2/APP_V2'
    And path 'AdmitPatient'
    And header Content-type = 'application/json'

  @tag1
  Scenario: Add patient to the existing list using AdmitPatient resource
    And def request_body = {"patientName": "Raji","age": "30","temperature": "097.80"}
    And request request_body
    When method post
    Then status 201
    And print response

  @tag2
  Scenario: Add patient by reading the external json file with input body
    And def request_body = read("request1.json")
    And request request_body
    When method post
    Then status 201
    And print response

  @tag3
  Scenario: change the value of the parameter using set method
    And def request_body = read("request1.json")
    And set request_body.age = 45
    * print request_body
    And request request_body
    When method post
    Then status 201
    And print response
    And remove request_body.age
    And request request_body
    When method post
    Then status 404
    And print response
    
  @tag4
  Scenario: Add patient by passing body object
    And request
    """
    {"patientName": "Raji","age": "32","temperature": "098.80"}
    """
    When method post
    Then status 201
    And print response
    
  @tag5
  Scenario: Add patient by creating body object
    * def requestpayload = {}
    * requestpayload.patientName = "Raji"
    * requestpayload.age = 32
    * requestpayload.temperature = 99
    * print requestpayload
    And request requestpayload
    When method post
    Then status 201
    And print response
    