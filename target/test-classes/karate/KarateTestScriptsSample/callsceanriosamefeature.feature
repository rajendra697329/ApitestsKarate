@igonre
Feature: Call sceanrio from other scenario in same feature file
  I want to use this template for my feature file

  @tag1
  Scenario: firstline
		* print 'this is first test'

  @tag2
  Scenario: secondline
		* print 'this is second test'
		* def result = call read('callsceanriosamefeature.feature@tag1')