package main

import (
	"strconv"
	"strings"
)

type Cell struct {
	val    int
	marked bool
}

type Board struct {
	grid   [][]Cell
	winner bool
}

type Win struct {
	board    Board
	draw_int int
}

func CreateBoard(input []string) Board {
	board := Board{}
	board.grid = make([][]Cell, 5)
	for j := 0; j < 5; j++ {
		row_numbers := strings.Fields(input[j])
		board.grid[j] = make([]Cell, 5)
		for k := 0; k < 5; k++ {
			board.grid[j][k].val, _ = strconv.Atoi(row_numbers[k])
		}
	}

	return board
}

func UpdateBoard(board Board, first_draw int) {
	for i := 0; i < 5; i++ {
		for j := 0; j < 5; j++ {
			if board.grid[i][j].val == first_draw {
				board.grid[i][j].marked = true
			}
		}
	}
}

func CheckBoard(board Board) Board {
	// check board if there are any marked rows, columns, or diagonals
	for i := 0; i < 5; i++ {
		col_sum := 0
		row_sum := 0
		diag_sum := 0
		diag_sum_rev := 0

		for j := 0; j < 5; j++ {
			if board.grid[i][j].marked {
				row_sum += 1
			}

			if board.grid[j][i].marked {
				col_sum += 1
			}

			if i == j && board.grid[i][j].marked {
				diag_sum += 1
			}

			if i+j == 4 && board.grid[i][j].marked {
				diag_sum_rev += 1
			}
		}

		if row_sum == 5 || col_sum == 5 || diag_sum == 5 || diag_sum_rev == 5 {
			board.winner = true
			return board
		}
	}

	return board
}

func FindUnmarkedCells(board Board) []Cell {
	unmarked_cells := make([]Cell, 0)
	for j := 0; j < 5; j++ {
		for k := 0; k < 5; k++ {
			if !board.grid[j][k].marked {
				unmarked_cells = append(unmarked_cells, board.grid[j][k])
			}
		}
	}

	return unmarked_cells
}

func WinningBoards(input []string) []Win {
	draw_numbers := strings.Split(input[0], ",")
	boards := make([]Board, 0)
	wins := make([]Win, 0)

	for i := 1; i < len(input); i += 5 {
		boards = append(boards, CreateBoard(input[i:i+5]))
	}

	win_count := 0
	for _, draw := range draw_numbers {
		for i := range boards {
			if win_count > len(boards) || boards[i].winner {
				continue
			}
			draw_int, _ := strconv.Atoi(draw)
			UpdateBoard(boards[i], draw_int)
			boards[i] = CheckBoard(boards[i])
			if boards[i].winner {
				win := Win{boards[i], draw_int}
				wins = append(wins, win)
				win_count += 1
			}
		}
	}

	return wins
}

func TallyCells(cells []Cell) int {
	sum := 0

	for _, cell := range cells {
		sum += cell.val
	}

	return sum
}

func DayFourPartOne(input []string) int {
	wins := WinningBoards(input)
	unmarked_cells := FindUnmarkedCells(wins[0].board)
	sum := TallyCells(unmarked_cells)
	return wins[0].draw_int * sum
}

func DayFourPartTwo(input []string) int {
	wins := WinningBoards(input)
	last_win := wins[len(wins)-1]
	unmarked_cells := FindUnmarkedCells(last_win.board)
	sum := TallyCells(unmarked_cells)
	return last_win.draw_int * sum
}
