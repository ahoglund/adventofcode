package main

import (
	"sort"
)

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

func IllegalChar(s string) int {
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

func DayTenPartTwo(input []string) int {
	scores := make([]int, 0)
	for _, line := range input {
		if FindIllegalChars(line) == "" {
			completes := make([]string, 0)
			stack := CharStack{}
			for _, r := range line {
				char := string(r)
				if char == "[" || char == "(" || char == "{" || char == "<" {
					stack.Push(char)
				}
				if char == "]" || char == ")" || char == "}" || char == ">" {
					stack.Pop()
				}

			}
			for _, r := range stack {
				if r == "(" {
					// add ) to the beginning of completes
					completes = append([]string{")"}, completes...)
				}
				if r == "[" {
					completes = append([]string{"]"}, completes...)
				}
				if r == "<" {
					completes = append([]string{">"}, completes...)
				}
				if r == "{" {
					completes = append([]string{"}"}, completes...)
				}
			}

			scores = append(scores, CalculateAutoCompleteScore(completes))

		}
	}

	sort.Ints(scores)

	return scores[len(scores)/2]
}
func CalculateAutoCompleteScore(completes []string) int {
	score := 0
	for _, c := range completes {
		score *= 5
		if c == ")" {
			score += 1
		}
		if c == "]" {
			score += 2
		}
		if c == ">" {
			score += 4
		}
		if c == "}" {
			score += 3
		}
	}
	return score
}

func FindIllegalChars(line string) string {
	stack := CharStack{}
	for _, r := range line {
		char := string(r)
		if char == "[" || char == "(" || char == "{" || char == "<" {
			stack.Push(char)
		}
		if char == "]" || char == ")" || char == "}" || char == ">" {
			openingChar := stack.Pop()
			if !charMatch(openingChar, char) {
				return char
			}
		}
	}

	return ""
}

func DayTenPartOne(input []string) int {
	illegals := make([]string, 0)
	for _, line := range input {
		illegals = append(illegals, FindIllegalChars(line))
	}

	sum := 0
	for _, z := range illegals {
		sum += IllegalChar(z)
	}

	return sum
}
