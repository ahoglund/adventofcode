package main

import (
	"fmt"
	"strconv"
	"strings"
)

type Dot struct {
	x, y int
}

func Day13Part1(input []string) int {
	paper := make([]Dot, 0)
	folds := make([]string, 0)
	for i := 0; i < len(input); i++ {
		if strings.Contains(input[i], "fold along") {
			folds = append(folds, strings.Split(input[i], "fold along ")[1])
		} else {
			// split line on comma
			coords := strings.Split(input[i], ",")
			x_i, _ := strconv.Atoi(coords[0])
			y_i, _ := strconv.Atoi(coords[1])
			dot := Dot{x: x_i, y: y_i}
			paper = append(paper, dot)
		}
	}

	for len(folds) != 0 {
		dots := make(map[Dot]bool)
		fold := folds[0]
		folds = folds[1:]
		coords := strings.Split(fold, "=")
		axis := coords[0]
		line, _ := strconv.Atoi(coords[1])

		if axis == "x" {
			for i, dot := range paper {
				if paper[i].x > line {
					var foldedDot Dot
					if (line - (dot.x % line)) == line {
						foldedDot = Dot{x: 0, y: dot.y}
					} else {
						foldedDot = Dot{x: (line - (dot.x % line)), y: dot.y}
					}
					dots[foldedDot] = true
				} else {
					dots[dot] = true
				}
			}
		}

		if axis == "y" {
			for i, dot := range paper {
				if paper[i].y > line {
					var foldedDot Dot
					if (line - (dot.y % line)) == line {
						foldedDot = Dot{x: dot.x, y: 0}
					} else {
						foldedDot = Dot{x: dot.x, y: (line - (dot.y % line))}
					}
					dots[foldedDot] = true
				} else {
					dots[dot] = true
				}
			}
		}
		paper = make([]Dot, 0)
		for dot, _ := range dots {
			paper = append(paper, dot)
		}
		fmt.Println("dots after fold:", len(dots))
	}

	PrintDots(paper)

	return 0
}

func PrintDots(dots []Dot) {
	// find max x and y in dots
	maxX := 0
	maxY := 0
	for _, dot := range dots {
		if dot.x > maxX {
			maxX = dot.x
		}
		if dot.y > maxY {
			maxY = dot.y
		}
	}

	for y := 0; y <= maxY; y++ {
		for x := 0; x <= maxX; x++ {
			var found bool
			for _, dot := range dots {
				if dot.x == x && dot.y == y {
					found = true
				}
			}
			if found {
				fmt.Print("#")
			} else {
				fmt.Print(".")
			}
		}
		fmt.Println()
	}
}
