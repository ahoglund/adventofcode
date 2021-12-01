package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

func removeEmpty(s []string) []string {
	var r []string
	for _, str := range s {
		if str != "" {
			r = append(r, str)
		}
	}
	return r
}

func GetInput(filename string) []int {
	cwd, _ := os.Getwd()

	content, err := ioutil.ReadFile(cwd + filename)
	if err != nil {
		fmt.Println(err)
	}

	// split content into a slice of strings
	lines := strings.Split(string(content), "\n")

	// remove empty strings
	lines = removeEmpty(lines)

	// convert slice of strings to slice of ints
	var ints []int
	for _, line := range lines {
		i, _ := strconv.Atoi(line)
		ints = append(ints, i)
	}

	return ints
}

func PartOne(input []int) int {
	// find all the times a number increases from the previous number
	// and add them to a slice
	increases := 0
	for i := 1; i < len(input); i++ {
		if input[i] > input[i-1] {
			increases += 1
		}
	}

	return increases
}

func PartTwo(input []int) int {
	// find all the increases where the measurement window
	// is a sliding scale of 3 numbers
	// and add them to a slice
	prev_window_sum := 0
	increases := 0
	for i := 2; i < len(input); i++ {
		// skip this iteration if the previous window sum is 0
		// because the window is not yet 3 numbers long
		if prev_window_sum == 0 {
			prev_window_sum = input[i-2] + input[i-1] + input[i]
			continue
		}

		window_sum := input[i-2] + input[i-1] + input[i]
		if window_sum > prev_window_sum {
			increases += 1
		}
		prev_window_sum = window_sum
	}

	return increases
}

func main() {
	test_filename := "/lib/adventofcode/2021/inputs/1_test.txt"
	filename := "/lib/adventofcode/2021/inputs/1.txt"
	input := GetInput(filename)
	test_input := GetInput(test_filename)
	fmt.Println(PartOne(input))
	fmt.Println(PartTwo(input))
	fmt.Println(PartTwo(test_input))
}
