package main

type CharStack []string

func (s *CharStack) IsEmpty() bool {
	return len(*s) == 0
}
func (s *CharStack) Push(str string) {
	*s = append(*s, str)
}

func (s *CharStack) Pop() string {
	index := len(*s) - 1
	element := (*s)[index]
	*s = (*s)[:index]
	return element
}

func charMatch(open string, cl string) bool {
	if open == ")" || open == "]" || open == ">" || open == "}" {
		return false
	}

	if open == "(" && cl != ")" {
		return false
	}

	if open == "[" && cl != "]" {
		return false
	}

	if open == "<" && cl != ">" {
		return false
	}

	if open == "{" && cl != "}" {
		return false
	}

	return true
}

func IllegalPoint(s string) int {
	if s == ")" {
		return 3
	}
	if s == "}" {
		return 1197
	}

	if s == "]" {
		return 57
	}

	if s == ">" {
		return 25137
	}

	return 0
}

func DayTenPartOne(input []string) int {
	illegals := make([]string, 0)
	for _, line := range input {
		stack := CharStack{}
		for _, r := range line {
			char := string(r)
			if char == "[" || char == "(" || char == "{" || char == "<" {
				stack.Push(char)
			}
			if char == "]" || char == ")" || char == "}" || char == ">" {
				openingChar := stack.Pop()
				if !charMatch(openingChar, char) {
					illegals = append(illegals, char)
				}
			}
		}
	}

	sum := 0
	for _, z := range illegals {
		sum += IllegalPoint(z)
	}

	return sum
}
