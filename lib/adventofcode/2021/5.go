package main

import (
	"fmt"
	"strconv"
	"strings"
)

type Line struct {
	start Point
	end   Point
}

func DayFivePartOne(input []string) int {
	points := make(map[Point]int)
	for _, line := range input {
		vent_line := Line{}
		parts := strings.Split(line, " -> ")
		start_coords := strings.Split(parts[0], ",")
		end_coords := strings.Split(parts[1], ",")

		start_coords_int := []int{}
		end_coords_int := []int{}

		for _, c := range start_coords {
			i, _ := strconv.Atoi(c)
			start_coords_int = append(start_coords_int, i)
		}

		for _, c := range end_coords {
			i, _ := strconv.Atoi(c)
			end_coords_int = append(end_coords_int, i)
		}

		vent_line.start = Point{start_coords_int[0], start_coords_int[1], 0}
		vent_line.end = Point{end_coords_int[0], end_coords_int[1], 0}

		var xs int
		var xe int

		var ys int
		var ye int

		if vent_line.start.y == vent_line.end.y {
			// need to accout for both ascending and descending lines
			if vent_line.start.x > vent_line.end.x {
				xs = vent_line.end.x
				xe = vent_line.start.x
			} else {
				xs = vent_line.start.x
				xe = vent_line.end.x
			}

			for xs <= xe {
				points[Point{xs, vent_line.start.y, 0}] += 1
				xs++
			}
		} else if vent_line.start.x == vent_line.end.x {
			// need to accout for both ascending and descending lines
			if vent_line.start.y > vent_line.end.y {
				ys = vent_line.end.y
				ye = vent_line.start.y
			} else {
				ys = vent_line.start.y
				ye = vent_line.end.y
			}

			// add
			for ys <= ye {
				points[Point{vent_line.start.x, ys, 0}] += 1
				ys++
			}
		} else {
			// dang diags
			if vent_line.start.x < vent_line.end.x && vent_line.start.y < vent_line.end.y {
				// asc diagonal to the right
				ys = vent_line.start.y

				for xs := vent_line.start.x; xs <= vent_line.end.x; xs++ {
					points[Point{xs, ys, 0}] += 1
					ys++
				}
			} else if vent_line.start.x > vent_line.end.x && vent_line.start.y > vent_line.end.y {
				// desc diagonal to the left
				ys = vent_line.end.y
				for xs := vent_line.end.x; xs <= vent_line.start.x; xs++ {
					points[Point{xs, ys, 0}] += 1
					ys++
				}
			} else if vent_line.start.x < vent_line.end.x && vent_line.start.y > vent_line.end.y {
				// desc diagonal to the right
				ys = vent_line.start.y
				for xs := vent_line.start.x; xs <= vent_line.end.x; xs++ {
					points[Point{xs, ys, 0}] += 1
					ys--
				}
			} else if vent_line.start.x > vent_line.end.x && vent_line.start.y < vent_line.end.y {
				// asc diagonal to the left
				ys = vent_line.end.y
				for xs := vent_line.end.x; xs <= vent_line.start.x; xs++ {
					points[Point{xs, ys, 0}] += 1
					ys--
				}
			} else {
				fmt.Println("missed")
				fmt.Println(vent_line)
			}
		}
	}

	overlaps := make([]Point, 0)
	for k, v := range points {
		if v > 1 {
			overlaps = append(overlaps, k)
		}
	}

	return len(overlaps)
}
