package main

import (
	"strconv"
	"strings"
)

type Lanterfish struct {
	timer int
}

func DaySixPartOne(input []string) int {
	init := strings.Split(input[0], ",")
	lfs := InitLanterfishes(init)
	return RunSimulation(80, lfs)
}

func DaySixPartTwo(input []string) int {
	init := strings.Split(input[0], ",")
	lfs := InitLanterfishes(init)
	return RunSimulation(256, lfs)
}

func InitLanterfishes(init []string) map[Lanterfish]int {
	lfs := make(map[Lanterfish]int, 9)

	for _, timer := range init {
		timer_int, _ := strconv.Atoi(timer)
		lf := Lanterfish{timer_int}
		lfs[lf] += 1
	}

	return lfs
}

func RunSimulation(days int, lfs map[Lanterfish]int) int {
	for i := 0; i < days; i++ {
		// doing this new map zero's out all the old values
		// and lets us add the new lower timer value
		// to the lanterfish that have a timer above zero
		// and lets us add another life for any zero timers.
		// If I didn't do this then it would keep the totals
		// from all the previous timers for each value.
		nlfs := make(map[Lanterfish]int, 9)

		for k, v := range lfs {
			if k.timer == 0 {
				nlfs[Lanterfish{8}] += v
				nlfs[Lanterfish{6}] += v
			} else {
				nlfs[Lanterfish{k.timer - 1}] += v
			}
		}

		lfs = nlfs
	}

	sum := 0
	for _, v := range lfs {
		sum += v
	}

	return sum
}
