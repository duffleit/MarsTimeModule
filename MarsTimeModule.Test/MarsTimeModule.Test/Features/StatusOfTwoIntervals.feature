Feature: Status of two intervals

Scenario Outline: Comparing two intervals
	Given is a mars time interval with a startingtime of <FirstIntStartTime> and a endingtime of <FirstIntEndTime>
	Given is a mars time interval with a startingtime of <SecondIntStartTime> and a endingtime of <SecondIntEndTime>
	When the last two intervals are compared 
	Then the result is <status>

	Examples: 
	| FirstIntStartTime | FirstIntEndTime | SecondIntStartTime | SecondIntEndTime | Status |
	| 10:00             | 12:00           | 11:00              | 11:30            | NESTED |



