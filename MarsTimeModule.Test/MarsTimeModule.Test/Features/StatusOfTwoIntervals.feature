Feature: Status of two intervals

Scenario Outline: 
	Given is a mars time interval with a startingtime of <FirstIntStartTime> and a endingtime of <FirstIntEndTime>
	Given is a mars time interval with a startingtime of <SecondIntStartTime> and a endingtime of <SecondIntEndTime>
	When the last two intervals are compared 
	Then the result is <status>

	Examples: 
	| FirstIntStartTime | FirstIntEndTime | SecondIntStartTime | SecondIntEndTime | Status |



