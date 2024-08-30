/*
Given the root of a binary tree, invert the tree, and return its root.

Example 1
Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]

Example 2
Input: root = [2,1,3]
Output: [2,3,1]

Example 3
Input: root = []
Output: []
*/

package main

import (
	"fmt"
	"reflect"
)

type TreeNode struct {
	Val   int
	Left  *TreeNode
	Right *TreeNode
}

type TestCase struct {
	Input          *TreeNode
	ExpectedOutput *TreeNode
}

func main() {
	cases := makeInputCases()

	for i := range cases {
		fmt.Println(fmt.Sprintf("Inverting binary tree: %d", i))
		c := cases[i]
		inverted := invertTree(c.Input)
		if reflect.DeepEqual(inverted, c.ExpectedOutput) {
			fmt.Println("✅ Binary tree inverted correctly")
			continue
		}

		fmt.Println("❌ - Binary tree inverted correctly")
	}
}

func invertTree(root *TreeNode) *TreeNode {
	if root == nil {
		return &TreeNode{}
	}

	left := root.Left
	right := root.Right

	root.Left = right
	root.Right = left
	invertTree(root.Left)
	invertTree(root.Right)
	return root
}

func makeInputCases() [3]TestCase {
	return [3]TestCase{
		TestCase{
			Input: &TreeNode{
				Val: 4,
				Left: &TreeNode{
					Val: 2,
					Left: &TreeNode{
						Val: 1,
					},
					Right: &TreeNode{
						Val: 3,
					},
				},
				Right: &TreeNode{
					Val: 7,
					Left: &TreeNode{
						Val: 6,
					},
					Right: &TreeNode{
						Val: 9,
					},
				},
			},
			ExpectedOutput: &TreeNode{
				Val: 4,
				Left: &TreeNode{
					Val: 7,
					Left: &TreeNode{
						Val: 9,
					},
					Right: &TreeNode{
						Val: 6,
					},
				},
				Right: &TreeNode{
					Val: 2,
					Left: &TreeNode{
						Val: 3,
					},
					Right: &TreeNode{
						Val: 1,
					},
				},
			},
		},
		TestCase{
			Input: &TreeNode{
				Val: 2,
				Left: &TreeNode{
					Val: 1,
				},
				Right: &TreeNode{
					Val: 3,
				},
			},
			ExpectedOutput: &TreeNode{
				Val: 2,
				Left: &TreeNode{
					Val: 3,
				},
				Right: &TreeNode{
					Val: 1,
				},
			},
		},
		TestCase{
			Input:          &TreeNode{},
			ExpectedOutput: &TreeNode{},
		},
	}
}
