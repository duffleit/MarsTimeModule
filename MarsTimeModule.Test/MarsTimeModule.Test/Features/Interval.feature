#language: en-US

Feature: Interval


Scenario Outline: Invalid Interval
	When a interval with a starttime of <StartTime> and a endtime of <EndTime> should be created
	Then a exception gets thrown

	Examples: 
	| id | StartTime | EndTime |
	| 0  | -3:12     | 10:00   |
	| 1  | 0:100     | 11:00   |
	| 2  | 0:39      | 25:00   |
	| 3  | 10:00     | 09:55   | 



Scenario Outline: Interval Relation
	Given is a interval with a starttime of <FirstIntStart> and a endtime of <FirstIntEnd>
	Given is a interval with a starttime of <SecondIntStart> and a endtime of <SecondIntEnd>
	Then the relation of the last two added intervals is <Relation>

	Examples: 
	| id | FirstIntStart | FirstIntEnd | SecondIntStart | SecondIntEnd | Relation | 
	| 0  | 10:00         | 15:00       | 10:01          | 14:55        | NESTED   |
	| 1  | 10:55         | 11:05       | 9:15           | 12:00        | NESTED   |
	| 2  | 10:00         | 12:55       | 13:10          | 14:30        | DISJOINT |
	| 3  | 16:00         | 17:55       | 13:10          | 14:30        | DISJOINT |
	| 4  | 09:00         | 20:99       | 20:99          | 20:99        | TOUCH    |	
	| 5  | 12:00         | 14:00       | 10:99          | 12:00        | TOUCH    |
	| 6  | 14:12         | 17:15       | 16:55          | 24:04        | OVERLAP  |
	| 7  | 17:97         | 17:99       | 16:55          | 17:98        | OVERLAP  |
