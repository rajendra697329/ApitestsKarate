@tag
Feature: Validate GET Api call using query params

  Scenario Outline: Validate GET API call using multiple values
    Given url 'http://10.82.180.36:8080/InfyClinicV2/APP_V2/getDoctor/byId?doctorId=<id>'
    When method GET
    Then status 200
    Then match $.doctorDTO.doctorId == '<id>'
    Then response.doctorDTO.doctorId == '<id>'

    Examples: 
      | id   |
      | 1001 |
      | 1002 |
      | 1003 |
      | 1004 |


