package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

type Point struct {
	x     int
	y     int
	value int
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
	case "3":
		fmt.Println("Day 3")
		fmt.Println(DayThreePartOne(GetInput(sample_input)))
		fmt.Println(DayThreePartOne(GetInput(real_input)))
		fmt.Println(DayThreePartTwo(GetInput(sample_input)))
		fmt.Println(DayThreePartTwo(GetInput(real_input)))
	case "4":
		fmt.Println("Day 4")
		fmt.Println(DayFourPartOne(GetInput(sample_input)))
		fmt.Println(DayFourPartOne(GetInput(real_input)))
		fmt.Println(DayFourPartTwo(GetInput(sample_input)))
		fmt.Println(DayFourPartTwo(GetInput(real_input)))
	case "5":
		fmt.Println("Day 5")
		// I did part 2 in part one function...
		fmt.Println(DayFivePartOne(GetInput(sample_input)))
		fmt.Println(DayFivePartOne(GetInput(real_input)))
		// fmt.Println(DayFivePartTwo(GetInput(sample_input)))
		// fmt.Println(DayFivePartTwo(GetInput(real_input)))
	case "6":
		fmt.Println("Day 6")
		fmt.Println(DaySixPartOne(GetInput(sample_input)))
		fmt.Println(DaySixPartOne(GetInput(real_input)))
		fmt.Println(DaySixPartTwo(GetInput(sample_input)))
		fmt.Println(DaySixPartTwo(GetInput(real_input)))
	case "7":
		fmt.Println("Day 7")
		fmt.Println(DaySevenPartOne(GetInput(sample_input)))
		fmt.Println(DaySevenPartOne(GetInput(real_input)))
		fmt.Println(DaySevenPartTwo(GetInput(sample_input)))
		fmt.Println(DaySevenPartTwo(GetInput(real_input)))
	case "8":
		fmt.Println("Day 8")
		fmt.Println(DayEightPartOne(GetInput(sample_input)))
		fmt.Println(DayEightPartOne(GetInput(real_input)))
		fmt.Println(DayEightPartTwo(GetInput(sample_input)))
		// fmt.Println(DayEightPartTwo(GetInput(real_input)))
	case "9":
		fmt.Println("Day 9")
		fmt.Println(DayNinePartOne(GetInput(sample_input)))
		fmt.Println(DayNinePartOne(GetInput(real_input)))
		fmt.Println(DayNinePartTwo(GetInput(sample_input)))
		fmt.Println(DayNinePartTwo(GetInput(real_input)))
	case "10":
		fmt.Println("Day 10")
		fmt.Println(DayTenPartOne(GetInput(sample_input)))
		fmt.Println(DayTenPartOne(GetInput(real_input)))
		fmt.Println(DayTenPartTwo(GetInput(sample_input)))
		fmt.Println(DayTenPartTwo(GetInput(real_input)))
	}
}
