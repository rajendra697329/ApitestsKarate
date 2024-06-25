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
@tag
Feature: DB connection

	Background: use the DB login details for all the scenarios
	* def config = { username: 'sa', password: '', url: 'jdbc:mysql://mem:testdb', driverClassName: 'com.mysql.jdbc.Driver' }
	* def DbUtils = Java.type('karate.KarateTestScriptsSample.DbUtils')
	* def db = new DbUtils(config)
  @tag1
  Scenario: Connect to Database using Karate
  * def salary = db.readValue("select salary from office where employee = 'john'")
  * print salary
