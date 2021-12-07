package main

import (
	"strconv"
	"strings"
)

// crab1: ................x
// crab2: .x...............
// crab3: ..x..............
// crab4: x................
// crab5: ....x............
// crab6: ..x..............
// crab7: .x...............

func DaySevenPartTwo(input []string) int {
	ps := strings.Split(input[0], ",")
	var ints []int

	for _, p := range ps {
		i, _ := strconv.Atoi(p)
		ints = append(ints, i)
	}

	maxPos := 0
	for _, v := range ints {
		if v > maxPos {
			maxPos = v
		}
	}

	fuelCosts := make(map[int]int)

	for i := 0; i < maxPos; i++ {
		// [16 1 2 0 4 2 7 1 2 14]
		for _, v := range ints {
			var steps int

			if v > i {
				steps = (v - i)
			} else {
				steps = (i - v)
			}

			stepCost := 0
			for j := 0; j < steps; j++ {
				stepCost += j
			}

			c := steps + stepCost
			fuelCosts[i] += c
		}
	}

	return findMin(fuelCosts)
}

func DaySevenPartOne(input []string) int {
	ps := strings.Split(input[0], ",")
	var ints []int

	for _, p := range ps {
		i, _ := strconv.Atoi(p)
		ints = append(ints, i)
	}

	maxPos := 0
	for _, v := range ints {
		if v > maxPos {
			maxPos = v
		}
	}

	fuelCosts := make(map[int]int)

	for i := 0; i < maxPos; i++ {
		// [16 1 2 0 4 2 7 1 2 14]
		for _, v := range ints {
			if v == i {
				continue
			}
			if v > i {
				fuelCosts[i] += (v - i)
			} else {
				fuelCosts[i] += (i - v)
			}
		}
	}

	return findMin(fuelCosts)
}

func findMin(input map[int]int) int {
	max := findMax(input)

	min := max
	for _, x := range input {
		if x < min {
			min = x
		}
	}

	return min
}

func findMax(input map[int]int) int {
	max := 0
	for _, x := range input {
		if x > max {
			max = x
		}
	}
	return max
}
