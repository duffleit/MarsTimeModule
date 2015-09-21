Feature: Interval Relations

Scenario Outline: Comparing two intervals
	Given is a mars time interval with a starttime of <FirstIntStartTime> and a endtime of <FirstIntEndTime>
	Given is a mars time interval with a starttime of <SecondIntStartTime> and a endtime of <SecondIntEndTime>
	Then the relation of the last two added intervals is <Relation>

	Examples: 
	| FirstIntStartTime | FirstIntEndTime | SecondIntStartTime | SecondIntEndTime | Relation |
	| 10:00             | 12:00           | 11:00              | 11:30            | NESTED   |
	| 09:00             | 20:99           | 20:45              | 21:15            | OVERLAP  |


