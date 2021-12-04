package main

import (
	"strconv"
)

type Totals struct {
	z [][]string
	o [][]string
}

func ConvertStrToBinary(str string) int64 {
	bin_i, _ := strconv.ParseInt(str, 2, 64)

	return bin_i
}

func GenerateTotals(input []string) Totals {
	totals := Totals{make([][]string, len(input[0])), make([][]string, len(input[0]))}

	for _, x := range input {
		for i := int(0); i < len(x); i++ {
			// check if the ith bit is set
			if ConvertStrToBinary(x)&(1<<i) != 0 {
				totals.o[i] = append(totals.o[i], x)
			} else {
				totals.z[i] = append(totals.z[i], x)
			}
		}
	}

	return totals
}

func DayThreePartOne(input []string) int {
	totals := GenerateTotals(input)

	gamma := 0x00
	epsilon := 0x00
	for i := range totals.o {
		// set ith bit of epsilon to 1 by default
		epsilon |= 1 << uint(i)
		if len(totals.o[i]) > len(totals.z[i]) {
			mask := 1 << uint(i)
			gamma |= mask
			epsilon &= ^mask
		}
	}

	return gamma * epsilon
}

func FilterTotalsOgr(input []string, bit int) []string {
	zeros := []string{}
	ones := []string{}

	for _, x := range input {
		if x[bit] == '0' {
			zeros = append(zeros, x)
		} else {
			ones = append(ones, x)
		}
	}

	if len(ones) == len(zeros) {
		return ones
	} else if len(ones) > len(zeros) {
		return ones
	} else {
		return zeros
	}
}

func FilterTotalsCo(input []string, bit int) []string {
	zeros := []string{}
	ones := []string{}

	for _, x := range input {
		if x[bit] == '0' {
			zeros = append(zeros, x)
		} else {
			ones = append(ones, x)
		}
	}

	if len(ones) == len(zeros) {
		return zeros
	} else if len(ones) < len(zeros) {
		return ones
	} else {
		return zeros
	}
}

func DayThreePartTwo(input []string) int {
	orig_input := input
	bit := 0
	for 1 < len(input) {
		input = FilterTotalsOgr(input, bit)
		bit++
	}

	ogr := input[0]

	input = orig_input
	bit = 0

	for 1 < len(input) {
		input = FilterTotalsCo(input, bit)
		bit++
	}

	co := input[0]

	return int(ConvertStrToBinary(ogr)) * int(ConvertStrToBinary(co))
}
