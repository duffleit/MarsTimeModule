Feature: Interval Relations

Scenario Outline: Comparing two intervals
	Given is a mars time interval with a starttime of <FirstIntStartTime> and a endtime of <FirstIntEndTime>
	Given is a mars time interval with a starttime of <SecondIntStartTime> and a endtime of <SecondIntEndTime>
	Then the relation of the last two added intervals is <Relation>

	Examples: 
	| FirstIntStartTime | FirstIntEndTime | SecondIntStartTime | SecondIntEndTime | Relation |
	| 10:00             | 12:00           | 11:00              | 11:30            | NESTED   |
	| 10:00             | 12:00           | 13:00              | 14:30            | DISJOINT |
	| 09:00             | 20:99           | 20:99              | 21:15            | TOUCH    |
	| 22:00             | 23:00           | 22:30              | 23:30            | OVERLAP  |

	@requirements
	Examples: 
	| FirstIntStartTime | FirstIntEndTime | SecondIntStartTime | SecondIntEndTime | Relation |
	| 14:12             | 17:15           | 16:55              | 24:04            | OVERLAP  |
	| 3:55              | 4:0             | 12:20              | 23:10            | DISJOINT |
	| 24:10             | 24:10           | 13:18              | 18:55            | DISJOINT |
	| 2:40              | 23:0            | 8:20               | 17:01            | NESTED   |
	| 0:0               | 24:99           | 23:1               | 24:99            | NESTED   |
	| 14:12             | 15:19           | 8:44               | 14:12            | TOUCH    | 