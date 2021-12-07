package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

func DayOnePartTwo(input []string) int {
	input_numbers := strings.Split(input[0], "")
	sum := 0
	for i, number := range input_numbers {
		match_idx := i + (len(input_numbers) / 2)
		// input_numbers[match_idx] is the index I need to check for a match with input_numbers[i] (or number).
		// I first need to check if the match_idx is out of bounds.
		if match_idx > len(input_numbers)-1 {
			match_idx = match_idx - len(input_numbers)
		}

		if number == input_numbers[match_idx] {
			number_int, _ := strconv.Atoi(number)
			sum += number_int
		}
	}

	return sum
}

func DayOnePartOne(input []string) int {
	input_numbers := strings.Split(input[0], "")

	sum := 0
	for i, number := range input_numbers {
		if i == len(input_numbers)-1 {
			if number == input_numbers[0] {
				number_int, _ := strconv.Atoi(number)
				sum += number_int
			}
		} else {
			if number == input_numbers[i+1] {
				number_int, _ := strconv.Atoi(number)
				sum += number_int
			}
		}
	}

	return sum
}

func main() {
	day_number := os.Args[1]
	sample_input := fmt.Sprintf("/inputs/%s_sample.txt", day_number)
	real_input := fmt.Sprintf("/inputs/%s.txt", day_number)

	fmt.Println(DayOnePartOne(GetInput(sample_input)))
	fmt.Println(DayOnePartOne(GetInput(real_input)))
	fmt.Println(DayOnePartTwo(GetInput(sample_input)))
	fmt.Println(DayOnePartTwo(GetInput(real_input)))
}

func removeEmpty(s []string) []string {
	var r []string
	for _, str := range s {
		if str != "" {
			r = append(r, str)
		}
	}
	return r
}

func GetInput(filename string) []string {
	cwd, _ := os.Getwd()

	content, err := ioutil.ReadFile(cwd + filename)
	if err != nil {
		fmt.Println(err)
	}

	// split content into a slice of strings
	lines := strings.Split(string(content), "\n")

	// remove empty strings
	lines = removeEmpty(lines)

	return lines
}
