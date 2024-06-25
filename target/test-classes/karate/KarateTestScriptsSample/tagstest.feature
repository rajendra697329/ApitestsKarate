# Update runner class to run specific tag
# tags are used to categorize and organize the features and scenarios
# tags help with selective test executions of scenarios when scenarios are with large volume
# Tags can be utilized in CI/CD pipelines to trigger selective test execution based on the tags
# tags help in testing specific test objectives
# <columnName>! - this is embedded expression in Karate which will correctly pass the dataType of the Paramerter
#For line 32 : --> here Embedded expression is used as data by defining the value of the variable in the start of the request
#columns declared in the examples section should be given in angular braces <column name>

Feature: Check Create and GET calls functionality

  @POST
  Scenario Outline: Create a student profile
    Given url 'http://10.82.180.36:8080'
    And path '/rest-session-demo/api/student'
     * def fname = "Raj2"
    And request {"name":"<name>", "rollNo":<rollNo>, "std":<std>}
    #And request {"name":"#(name)", "rollNo":#(rollNo), "std":#(std)} - this format is auto variable feature in karate where you can use column name as variable name 
    And header Accept = 'application/json'
    When method POST
    Then status 201
    And print response
    * def rname = karate.get('$.name')
    And match rname == "<name>"
    * print __row
    * print __num
    * print name
    * print rollNo
    * print std
   
    
      Examples: 
      | name  	|rollNo! | std!   |
      | #(fname) 		|1234 	|VI 		|
      | Chay2		|2233 	|VII 		|
      | Namish2 	|3344 	|VIII 	|
      | Sree2 		|5566 	|V 			|

  @GETStudent
  Scenario: Fetch student data 101 by mentioning the GET tag in runner class
    Given url 'http://10.82.180.36:8080/rest-session-demo/api/student/v2'
    And path '101'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And match response contains {"rollNo":101}
    
  @GETQuestions
  Scenario: Fetch student data 101 by mentioning the GET tag in runner class
    Given url 'http://10.82.180.36:8080/AmigoWallet/RegistrationAPI/getAllQuestions'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    * def jsonObject =
    """
    [{"questionId":210002,"question":"In what city or town does your nearest sibling live?"},{"questionId":210003,"question":"What is the name of city you were born in?"},{"questionId":210004,"question":"What school did you attend for third grade?"},{"questionId":210001,"question":"What was the name of your elementary / primary school?"},{"questionId":210006,"question":"What was the name of your first pet?"},{"questionId":210005,"question":"What was your GrandFather's occupation?"}]
    """
    Then match response[0] contains {"questionId" : 210002}
 		Then match $.length() == 6
 		Then  karate.get('response[1].question')
 		Then karate.get('$..question')
 		* print karate.jsonPath(jsonObject,'$.[?(@.questionId == 210005)].question')
 		* print karate.get('$..questionId..question')
 		* print karate.get('$.[1].questionId')
 		* print karate.get('$.[3,4].question')
