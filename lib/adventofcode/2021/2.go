package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strconv"
	"strings"
)

type Command struct {
	direction string
	distance  int
}

type Coordinate struct {
	x int
	y int
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

func GetInput(filename string) []Command {
	cwd, _ := os.Getwd()

	content, err := ioutil.ReadFile(cwd + filename)
	if err != nil {
		fmt.Println(err)
	}

	// split content into a slice of strings
	lines := strings.Split(string(content), "\n")

	// remove empty strings
	lines = removeEmpty(lines)

	// convert each string into an array of Command structs
	commands := make([]Command, len(lines))
	for i, line := range lines {
		// split line into a slice of strings
		parts := strings.Split(line, " ")

		// remove empty strings
		parts = removeEmpty(parts)

		// convert each string into a Command struct

		distance, _ := strconv.Atoi(parts[1])

		commands[i] = Command{
			direction: parts[0],
			distance:  distance,
		}
	}

	return commands
}

func PartOne(commands []Command) int {
	coordinate := Coordinate{
		x: 0,
		y: 0,
	}

	for i, _ := range commands {
		switch commands[i].direction {
		case "forward":
			coordinate.x += commands[i].distance
		case "down":
			coordinate.y += commands[i].distance
		case "up":
			coordinate.y -= commands[i].distance
		}
	}

	return coordinate.x * coordinate.y
}

func PartTwo(commands []Command) int {
	coordinate := Coordinate{
		x: 0,
		y: 0,
	}

	aim := 0

	for i, _ := range commands {
		switch commands[i].direction {
		case "forward":
			coordinate.x += commands[i].distance
			coordinate.y += aim * commands[i].distance
		case "down":
			aim += commands[i].distance
		case "up":
			aim -= commands[i].distance
		}
	}

	return coordinate.x * coordinate.y
}

func main() {
	sample_input := "/lib/adventofcode/2021/inputs/2_sample.txt"
	real_input := "/lib/adventofcode/2021/inputs/2.txt"
	fmt.Println(PartOne(GetInput(sample_input)))
	fmt.Println(PartOne(GetInput(real_input)))
	fmt.Println(PartTwo(GetInput(sample_input)))
	fmt.Println(PartTwo(GetInput(real_input)))
}
