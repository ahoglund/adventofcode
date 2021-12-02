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

func InputToArrayOfInts(filename string) []int {
	lines := GetInput(filename)
	// convert slice of strings to slice of ints
	var ints []int
	for _, line := range lines {
		i, _ := strconv.Atoi(line)
		ints = append(ints, i)
	}

	return ints
}

func main() {
	day_number := os.Args[1]
	sample_input := fmt.Sprintf("/inputs/%s_sample.txt", day_number)
	real_input := fmt.Sprintf("/inputs/%s.txt", day_number)

	switch day_number {
	case "1":
		fmt.Println("Day 1")
		fmt.Println(DayOnePartOne(InputToArrayOfInts(sample_input)))
		fmt.Println(DayOnePartOne(InputToArrayOfInts(real_input)))
		fmt.Println(DayOnePartTwo(InputToArrayOfInts(sample_input)))
		fmt.Println(DayOnePartTwo(InputToArrayOfInts(real_input)))
	case "2":
		fmt.Println("Day 2")
		fmt.Println(DayTwoPartOne(GetInput(sample_input)))
		fmt.Println(DayTwoPartOne(GetInput(real_input)))
		fmt.Println(DayTwoPartTwo(GetInput(sample_input)))
		fmt.Println(DayTwoPartTwo(GetInput(real_input)))
	}
}
