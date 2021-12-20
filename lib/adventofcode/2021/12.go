package main

import (
	"fmt"
	"strings"
)

// input:
// dc-end
// HN-start
// start-kj
// dc-start
// dc-HN
// LN-dc
// HN-end
// kj-sa
// kj-HN
// kj-dc

type Node struct {
	children []*Node
}

func (n *Node) addChild(c *Node) {
	n.children = append(n.children, c)
}

func DayTwelvePartOne(input []string) int {
	nodes := make(map[string]Node)
	for _, line := range input {
		parts := strings.Split(line, "-")
		for i := 0; i < len(parts); i++ {
			parts[i] = strings.TrimSpace(parts[i])
			nodes[parts[i]] = Node{}
		}
	}

	fmt.Println(nodes)
	return 0
}
