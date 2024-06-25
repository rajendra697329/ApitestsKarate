#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template

Feature: Fetch user details

	Background: To retrieve the details of GET API
		Given url 'http://10.82.180.36:8080'
		And path 'InfyClinicV2'
		And path 'APP_V2'
		And path 'getDoctor'
		And path 'byId'
		And param doctorId = '1004'
    When method GET
    Then status 200

  Scenario: See the response of GET API of getDoctor resource
    * print response 

    Scenario: Assert the response fields from GET API
    * assert response.doctorDTO.doctorId == 1004  
    * assert response.doctorDTO.doctorName == 'Kinsey'
    * def id = response.doctorDTO.doctorId
    * def name = response.doctorDTO.doctorName
    * assert id + name == '1004Kinsey'
  
    Scenario: use match to validate the response
    * match response.doctorDTO.doctorId == '#string'
    * match response.doctorDTO.doctorName == '#string'
    * match response.doctorDTO.availableName == '#present'
    * match response.doctorDTO == '#notnull'
    * match response.doctorDTO contains {doctorId:'#string? _ > 1004',doctorName:'#string'}
    

    
    

