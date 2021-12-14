package main

import (
	"sort"
	"strconv"
	"strings"
)

type Basin struct {
	points []Point
}

type Stack []Point

func (s *Stack) IsEmpty() bool {
	return len(*s) == 0
}
func (s *Stack) Push(point Point) {
	*s = append(*s, point)
}

func (s *Stack) Pop() Point {
	index := len(*s) - 1
	element := (*s)[index]
	*s = (*s)[:index]
	return element
}

func AdjacentPoints(inputInt [][]int, point Point) []Point {
	adjacentPoints := make([]Point, 0)
	if point.x > 0 {
		adjacentPoints = append(adjacentPoints, Point{point.x - 1, point.y, inputInt[point.x-1][point.y]})
	}

	if point.x < len(inputInt)-1 {
		adjacentPoints = append(adjacentPoints, Point{point.x + 1, point.y, inputInt[point.x+1][point.y]})
	}

	if point.y > 0 {
		adjacentPoints = append(adjacentPoints, Point{point.x, point.y - 1, inputInt[point.x][point.y-1]})
	}

	if point.y < len(inputInt[point.x])-1 {
		adjacentPoints = append(adjacentPoints, Point{point.x, point.y + 1, inputInt[point.x][point.y+1]})
	}

	return adjacentPoints
}

// write a function that takes a point and flood fills it
func FloodFill(inputInt [][]int, startingPoint Point) Basin {
	basin := Basin{}
	seen := make(map[Point]bool, 0)
	var stack Stack
	stack.Push(startingPoint)

	for !stack.IsEmpty() {
		point := stack.Pop()

		if seen[point] == false {
			seen[point] = true
			if point.value >= startingPoint.value {
				basin.points = append(basin.points, point)
			}
		}

		adjacentPoints := AdjacentPoints(inputInt, point)

		for _, adjacentPoint := range adjacentPoints {
			if seen[adjacentPoint] == false && adjacentPoint.value < 9 {
				stack.Push(adjacentPoint)
			}
		}
	}

	return basin
}

func DayNinePartTwo(input []string) int {
	inputInt := make([][]int, len(input))
	for i, line := range input {
		parts := strings.Split(line, "")

		for _, part := range parts {
			pInt, _ := strconv.Atoi(part)
			inputInt[i] = append(inputInt[i], pInt)
		}
	}

	lowPoints := LowPoints(inputInt)
	basins := []Basin{}
	for _, point := range lowPoints {
		basins = append(basins, FloodFill(inputInt, point))
	}

	// sort basins by size
	sort.Slice(basins, func(i, j int) bool {
		return len(basins[i].points) > len(basins[j].points)
	})

	return len(basins[0].points) * len(basins[1].points) * len(basins[2].points)
}

func LowPoints(inputInt [][]int) []Point {
	lowPoints := make([]Point, 0)
	for i, l := range inputInt {
		for x, part := range l {
			var lowPoint bool = true
			if x+1 < len(inputInt[i]) && inputInt[i][x+1] <= part {
				lowPoint = false
			}
			if x-1 >= 0 && inputInt[i][x-1] <= part {
				lowPoint = false
			}
			if i > 0 && inputInt[i-1][x] <= part {
				lowPoint = false
			}
			if i < len(inputInt)-1 && inputInt[i+1][x] <= part {
				lowPoint = false
			}
			if lowPoint {
				point := Point{i, x, part + 1}
				lowPoints = append(lowPoints, point)
			}
		}
	}

	return lowPoints
}

func DayNinePartOne(input []string) int {
	inputInt := make([][]int, len(input))
	for i, line := range input {
		parts := strings.Split(line, "")

		for _, part := range parts {
			pInt, _ := strconv.Atoi(part)
			inputInt[i] = append(inputInt[i], pInt)
		}
	}

	lowPoints := LowPoints(inputInt)
	sum := 0
	for _, point := range lowPoints {
		sum += point.value
	}
	return sum
}
