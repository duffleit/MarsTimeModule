
Feature: Interval


Scenario Outline: Invalid Interval
	When a interval with a starttime of <StartTime> and a endtime of <EndTime> should be created
	Then a exception gets thrown

	Examples: 
	| id | rq | StartTime | EndTime |
	| 0  | 6  | -3:12     | 10:00   |
	| 1  | 6  | 0:100     | 11:00   |
	| 2  | 6  | 0:39      | 25:00   |
	| 3  | 5  | 10:00     | 09:55   | 



Scenario Outline: Interval Relation
	Given is a interval with a starttime of <FirstIntStart> and a endtime of <FirstIntEnd>
	Given is a interval with a starttime of <SecondIntStart> and a endtime of <SecondIntEnd>
	Then the relation of the last two added intervals is <Relation>

	Examples: 
	| id | rq | FirstIntStart | FirstIntEnd | SecondIntStart | SecondIntEnd | Relation |
	| 0  | 1  | 10:00         | 15:00       | 10:01          | 14:55        | NESTED   |
	| 1  | 1  | 10:55         | 11:05       | 9:15           | 12:00        | NESTED   |
	| 2  | 2  | 10:00         | 12:55       | 13:10          | 14:30        | DISJOINT |
	| 3  | 2  | 16:00         | 17:55       | 13:10          | 14:30        | DISJOINT |
	| 4  | 3  | 09:00         | 20:99       | 20:99          | 20:99        | TOUCH    |
	| 5  | 3  | 12:00         | 14:00       | 10:99          | 12:00        | TOUCH    |
	| 6  | 4  | 14:12         | 17:15       | 16:55          | 24:04        | OVERLAP  |
	| 7  | 4  | 17:97         | 17:99       | 16:55          | 17:98        | OVERLAP  |
