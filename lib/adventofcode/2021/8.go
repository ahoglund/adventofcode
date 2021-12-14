package main

import (
	"fmt"
	"sort"
	"strings"
)

// seven-segment display
// https://adventofcode.com/2020/day/8
// function to get the permutations of a list of ints
func permutationsInt(input []int) [][]int {
	result := [][]int{}

	if len(input) == 1 {
		result = append(result, input)
		return result
	}

	for i := 0; i < len(input); i++ {
		// [1,2,3]
		c := input[i : i+1]
		rest := []int{}
		// join the rest of the list
		for _, v := range input {
			if v != c[0] {
				rest = append(rest, v)
			}
		}

		for _, p := range permutationsInt(rest) {
			result = append(result, append(p, c...))
		}
	}

	return result
}

func permutations(input string) []string {
	result := []string{}

	if len(input) == 1 {
		result = append(result, input)
		return result
	}

	for i := 0; i < len(input); i++ {
		c := input[i : i+1]
		rest := input[:i] + input[i+1:]

		for _, p := range permutations(rest) {
			result = append(result, c+p)
		}
	}

	return result
}

func StringToRuneSlice(s string) []rune {
	var r []rune
	for _, runeValue := range s {
		r = append(r, runeValue)
	}
	return r
}

func SortStringByCharacter(s string) string {
	r := StringToRuneSlice(s)
	sort.Slice(r, func(i, j int) bool {
		return r[i] < r[j]
	})
	return string(r)
}

func DayEightPartTwo(input []string) int {
	//  0000
	// 5    1
	// 5    1
	//  6666
	// 4    2
	// 4    2
	//  3333

	// 1 uses 2 segments
	// 4 uses 4 segments
	// 7 uses 3 segments
	// 8 uses all 7 segments
	// 5, 2, 3 use 5 segments
	// 6, 9 and 0 use 6 segments
	permutations := permutations("abcdefg")
	// fmt.Println(permutations)
	one := []int{1, 2}
	two := []int{0, 1, 6, 4, 3}
	three := []int{0, 1, 2, 3, 6}
	four := []int{1, 2, 5, 6}
	five := []int{0, 2, 3, 5, 6}
	six := []int{0, 2, 3, 4, 5, 6}
	seven := []int{0, 1, 2}
	eight := []int{0, 1, 2, 3, 4, 5, 6}
	nine := []int{0, 1, 2, 3, 5, 6}
	zero := []int{0, 1, 2, 3, 4, 5}

	numbers := [][]int{one, two, three, four, five, six, seven, eight, nine, zero}
	for _, l := range input {
		fmt.Println("LINE")
		line := strings.Split(l, "|")
		signalPatterns := strings.Fields(line[0])
		for i, v := range signalPatterns {
			signalPatterns[i] = SortStringByCharacter(v)

		}

		sort.Slice(signalPatterns, func(i, j int) bool {
			return len(signalPatterns[i]) < len(signalPatterns[j])
		})

		fmt.Println(signalPatterns)
		for _, perm := range permutations {
			try := []string{}
			split := strings.Split(perm, "")
			for _, n := range numbers {
				str := ""
				for _, i := range n {
					str += split[i]
				}
				// sort the chars in str
				str = SortStringByCharacter(str)
				try = append(try, str)
			}

			sort.Slice(try, func(i, j int) bool {
				return len(try[i]) < len(try[j])
			})

			if strings.Join(try, "") == strings.Join(signalPatterns, "") {
				fmt.Println(perm)
			} else {
				ints := []int{3, 4, 5, 6, 7, 8}
				idxPerms := permutationsInt(ints)
				for _, perm := range idxPerms {
					newTry := try
					for i, x := range ints {
						newTry[x] = try[perm[i]]
					}
					// fmt.Println(newTry)
					if strings.Join(newTry, "") == strings.Join(signalPatterns, "") {
						fmt.Println("GOT IT")
						return 0
					}
				}
			}
		}
		return 0
	}
	// for _, l := range input {
	// fmt.Println("LINE")
	// line := strings.Split(l, "|")
	// signalPatterns := strings.Fields(line[0])
	// outputValue := strings.Fields(line[1])

	// sort.Slice(outputValue, func(i, j int) bool {
	// 	return len(outputValue[i]) < len(outputValue[j])
	// })

	// sort.Slice(signalPatterns, func(i, j int) bool {
	// 	return len(signalPatterns[i]) < len(signalPatterns[j])
	// })

	// }

	return 0
}

func DayEightPartOne(input []string) int {
	// 1 uses 2 segments
	// 4 uses 4 segments
	// 7 uses 3 segments
	// 8 uses all 7 segments
	sum := 0
	for _, l := range input {
		line := strings.Split(l, "|")
		//signalPatterns := strings.Fields(line[0])
		outputValue := strings.Fields(line[1])
		// only care about 1,4,7,8
		for _, v := range outputValue {
			length := len(v)
			if length == 2 || length == 3 || length == 4 || length == 7 {
				sum += 1
			}
		}
	}

	return sum
}

// // only care about 1,4,7,8
// for _, v := range signalPatterns {
// 	length := len(v)
// 	splitSignalPattern := strings.Split(v, "")
// 	joinedSignalPattern := strings.Join(splitSignalPattern, "")
// 	// if sorted signal patter is equal to one of the sorted output values then we know we have a match
// 	if length == 2 {
// 		assigns[1] = joinedSignalPattern
// 	}
// 	if length == 3 {
// 		assigns[7] = joinedSignalPattern
// 	}
// 	if length == 4 {
// 		assigns[4] = joinedSignalPattern
// 	}
// 	if length == 7 {
// 		assigns[8] = joinedSignalPattern
// 	}
// 	if length == 5 {
// 		// its a 2,3,5
// 		// its a 3 if the 5 char string contains
// 		// all the chars from the 7 value plus 2 more.
// 		// check if the there characters in assigns[7] are in joinedSignalPattern, in any order
// 		if strings.Contains(joinedSignalPattern, string(assigns[7][0])) &&
// 			strings.Contains(joinedSignalPattern, string(assigns[7][1])) &&
// 			strings.Contains(joinedSignalPattern, string(assigns[7][2])) {
// 			fmt.Println(joinedSignalPattern)
// 			assigns[3] = joinedSignalPattern
// 		}
// 	}
// 	if length == 6 {
// 		// its a 0, 6, 9
// 	}
// }
// fmt.Println(signalPatterns)
// fmt.Println(assigns)
// return 0
