
Feature: Call a sceanrio from other scenario in different feature file
  I want to use this template for my feature file

  @tag3
  Scenario: thirdline
		* print 'this is third test'

  @tag4
  Scenario: fourthline
		* print 'this is fourth test'
		* def result = call read('callsceanriosamefeature.feature@tag1')