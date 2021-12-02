package main

func DayOnePartOne(input []int) int {
	// find all the times a number increases from the previous number
	// and add them to a slice
	increases := 0
	for i := 1; i < len(input); i++ {
		if input[i] > input[i-1] {
			increases += 1
		}
	}

	return increases
}

func DayOnePartTwo(input []int) int {
	// find all the increases where the measurement window
	// is a sliding scale of 3 numbers
	// and add them to a slice
	prev_window_sum := 0
	increases := 0
	for i := 2; i < len(input); i++ {
		// skip this iteration if the previous window sum is 0
		// because the window is not yet 3 numbers long
		if prev_window_sum == 0 {
			prev_window_sum = input[i-2] + input[i-1] + input[i]
			continue
		}

		window_sum := input[i-2] + input[i-1] + input[i]
		if window_sum > prev_window_sum {
			increases += 1
		}
		prev_window_sum = window_sum
	}

	return increases
}
