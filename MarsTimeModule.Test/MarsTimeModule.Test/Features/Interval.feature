
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

	Examples: 
	| id | rq | StartTime | EndTime |
	| 0  | 0  | -2:05     | 5:60    |
	| 0  | 0  | 18:70     | 28:03   |
	| 0  | 0  | 20:05     | 6:10    |
	| 0  | 0  | 12:0      | 25:0    |

	Examples:
	| id | rq | StartTime | EndTime |
	| 0  | 0  | 24:1      | 25:1    |
	| 0  | 0  | -1:10     | 2:20    |
	| 0  | 0  | 19:15     | 19:14   |



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

	Examples: 
	| id | rq | FirstIntStart | FirstIntEnd | SecondIntStart | SecondIntEnd | Relation |
	| 0  | 0  | 0:5           | 0:10        | 24:0           | 24:10        | DISJOINT |
	| 0  | 0  | 8:20          | 12:0        | 12:0           | 19:40        | TOUCH    |
	| 0  | 0  | 7:35          | 13:90       | 9:45           | 20:20        | OVERLAP  |
	| 0  | 0  | 10:10         | 10:20       | 10:10          | 10:20        | NESTED   |
	| 0  | 0  | 5:90          | 16:10       | 10:0           | 24:90        | OVERLAP  |
	| 0  | 0  | 3:15          | 6:25        | 3:16           | 6:25         | NESTED   |
	| 0  | 0  | 6:20          | 10:50       | 0:0            | 6:20         | TOUCH    |
	| 0  | 0  | 24:99         | 24:99       | 0:0            | 0:0          | DISJOINT |

	
	Examples:	
	| id | rq | FirstIntStart | FirstIntEnd | SecondIntStart | SecondIntEnd | Relation |
	| 0  | 0  | 0:0           | 24:99       | 12:1           | 12:2         | NESTED   |
	| 0  | 0  | 7:98          | 7:99        | 7:98           | 7:99         | NESTED   |
	| 0  | 0  | 0:0           | 0:0         | 0:0            | 0:0          | TOUCH    |
	| 0  | 0  | 0:0           | 24:98       | 5:5            | 24:99        | OVERLAP  |
	| 0  | 0  | 20:1          | 21:5        | 20:78          | 21:6         | OVERLAP  |
	| 0  | 0  | 14:12         | 15:19       | 8:44           | 14:12        | TOUCH    |
	| 0  | 0  | 4:67          | 4:71        | 4:71           | 4:79         | TOUCH    |
	| 0  | 0  | 0:0           | 12.45       | 12:46          | 24:99        | DISJOINT |
	| 0  | 0  | 8:7           | 8:99        | 23:20          | 24:0         | DISJOINT |

