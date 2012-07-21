Feature: division




Scenario Outline: Divide two numbers
	Given the input "<input>"
	When the calculator is run
	Then the output should be "<output>"

	Examples:
		|input| output|
		|20/2  | 10   |
		|100/10 | 10   |
		|50/10 | 5   |
		|8/1 | 8   |
		|98/98 | 1   |
		
