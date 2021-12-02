package main

import (
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

func GenerateCommands(lines []string) []Command {
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

func DayTwoPartOne(input []string) int {
	commands := GenerateCommands(input)
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

func DayTwoPartTwo(input []string) int {
	commands := GenerateCommands(input)
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
