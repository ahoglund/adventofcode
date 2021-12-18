package main

import (
	"fmt"
	"strconv"
	"strings"
)

func PrintPuses(grid [][]Pus) {
	fmt.Print("\033[2J")
	for _, row := range grid {
		for j, pus := range row {
			fmt.Printf("%3d", pus.energy)
			if j == len(row)-1 {
				fmt.Printf("\n")
			}
		}
	}
}

type Pus struct {
	energy int
	x, y   int
}

func IncreaseNeighbors(grid [][]Pus, pus Pus) []Pus {
	neighs := []Pus{}
	if pus.x > 0 {
		if grid[pus.x-1][pus.y].energy != 0 {
			grid[pus.x-1][pus.y].energy += 1
		}
		if grid[pus.x-1][pus.y].energy > 9 {
			neighs = append(neighs, Pus{grid[pus.x-1][pus.y].energy, pus.x - 1, pus.y})
			grid[pus.x-1][pus.y].energy = 0
		}
	}
	if pus.x < len(grid)-1 {
		if grid[pus.x+1][pus.y].energy != 0 {
			grid[pus.x+1][pus.y].energy += 1
		}
		if grid[pus.x+1][pus.y].energy > 9 {
			neighs = append(neighs, Pus{grid[pus.x+1][pus.y].energy, pus.x + 1, pus.y})
			grid[pus.x+1][pus.y].energy = 0
		}
	}
	if pus.y > 0 {
		if grid[pus.x][pus.y-1].energy != 0 {
			grid[pus.x][pus.y-1].energy += 1
		}
		if grid[pus.x][pus.y-1].energy > 9 {
			neighs = append(neighs, Pus{grid[pus.x][pus.y-1].energy, pus.x, pus.y - 1})
			grid[pus.x][pus.y-1].energy = 0
		}
	}
	if pus.y < len(grid[0])-1 {
		if grid[pus.x][pus.y+1].energy != 0 {
			grid[pus.x][pus.y+1].energy += 1
		}
		if grid[pus.x][pus.y+1].energy > 9 {
			neighs = append(neighs, Pus{grid[pus.x][pus.y+1].energy, pus.x, pus.y + 1})
			grid[pus.x][pus.y+1].energy = 0
		}
	}
	if pus.x > 0 && pus.y > 0 {
		if grid[pus.x-1][pus.y-1].energy != 0 {
			grid[pus.x-1][pus.y-1].energy += 1
		}
		if grid[pus.x-1][pus.y-1].energy > 9 {
			neighs = append(neighs, Pus{grid[pus.x-1][pus.y-1].energy, pus.x - 1, pus.y - 1})
			grid[pus.x-1][pus.y-1].energy = 0
		}
	}
	if pus.x < len(grid[0])-1 && pus.y < len(grid)-1 {
		if grid[pus.x+1][pus.y+1].energy != 0 {
			grid[pus.x+1][pus.y+1].energy += 1
		}
		if grid[pus.x+1][pus.y+1].energy > 9 {
			neighs = append(neighs, Pus{grid[pus.x+1][pus.y+1].energy, pus.x + 1, pus.y + 1})
			grid[pus.x+1][pus.y+1].energy = 0
		}
	}
	if pus.y > 0 && pus.x < len(grid)-1 {
		if grid[pus.x+1][pus.y-1].energy != 0 {
			grid[pus.x+1][pus.y-1].energy += 1
		}
		if grid[pus.x+1][pus.y-1].energy > 9 {
			neighs = append(neighs, Pus{grid[pus.x+1][pus.y-1].energy, pus.x + 1, pus.y - 1})
			grid[pus.x+1][pus.y-1].energy = 0
		}
	}
	if pus.y < len(grid[0])-1 && pus.x > 0 {
		if grid[pus.x-1][pus.y+1].energy != 0 {
			grid[pus.x-1][pus.y+1].energy += 1
		}
		if grid[pus.x-1][pus.y+1].energy > 9 {
			neighs = append(neighs, Pus{grid[pus.x-1][pus.y+1].energy, pus.x - 1, pus.y + 1})
			grid[pus.x-1][pus.y+1].energy = 0
		}
	}

	return neighs
}

func DayElevenPartOne(input []string) int {
	input_int := make([][]Pus, len(input))
	flashes := 0
	for ri, row := range input {
		splRow := strings.Split(row, "")
		input_int[ri] = make([]Pus, len(splRow))
		for ci, col := range splRow {
			col_i, _ := strconv.Atoi(col)
			input_int[ri][ci] = Pus{col_i, ri, ci}
		}
	}

	for step := 0; step < 1000; step++ {
		for ri, row := range input_int {
			for ci, pus := range row {
				pus.energy += 1
				input_int[ri][ci] = Pus{pus.energy, ri, ci}
			}
		}

		stack := PusStack{}
		for _, row := range input_int {
			for _, pus := range row {
				if pus.energy > 9 {
					input_int[pus.x][pus.y].energy = 0
					flashes++
					stack.Push(pus)
					for !stack.IsEmpty() {
						flashyNeighs := IncreaseNeighbors(input_int, stack.Pop())
						flashes += len(flashyNeighs)
						for _, flashyNeigh := range flashyNeighs {
							stack.Push(flashyNeigh)
						}
					}
				}
			}
		}

		allzeros := true
		for _, row := range input_int {
			for _, pus := range row {
				if pus.energy != 0 {
					allzeros = false
				}
			}
		}

		if allzeros {
			fmt.Println("All zeros")
			return step
		}
	}

	return flashes
}

type PusStack []Pus

func (s *PusStack) IsEmpty() bool {
	return len(*s) == 0
}
func (s *PusStack) Push(pus Pus) {
	*s = append(*s, pus)
}

func (s *PusStack) Pop() Pus {
	index := len(*s) - 1
	element := (*s)[index]
	*s = (*s)[:index]
	return element
}
