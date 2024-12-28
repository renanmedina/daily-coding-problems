```markdown
package main

import (
	"container/heap"
	"fmt"
)

type Course struct {
	CourseId string
	Prerequisites []string
}

type courseHeap [][]string

func compareCourses(a, b courseHeap) int {
	if a[0] < b[0] {
		return -1
	} else if a[0] > b[0] {
		return 1
	}
	return 0
}

func sortCourse(prerequisites map[string][]string) []string {
	courses := make([][]string, 0)
	for course, prereqs := range prerequisites {
		courses = append(courses, []string{course})
		for _, prereq := range prereqs {
			courses = append(courses, []string{prereq})
		}
	}

	var h courseHeap
	for i := 0; i < len(courses); i++ {
		heap.Push(&h, courses[i])
	}

	var result []string
	for len(h) > 0 {
		course := heap.Pop(&h).([]string)
		result = append(result, course[0])

		for _, prereq := range prerequisites[course[0]] {
			var index int
			for i, c := range courses {
				if c[0] == prereq {
					index = i
					break
				}
			}
			courses[index] = append(courses[index][:0], courses[index][1:]...)
			if len(courses[index]) > 0 {
				heap.Push(&h, courses[index])
			} else {
				return nil
			}
		}
	}

	return result
}

func main() {
	prerequisites := map[string][]string{
		"CSC300": {"CSC100", "CSC200"},
		"CSC200": {"CSC100"},
		"CSC100": {},
	}
	fmt.Println(sortCourse(prerequisites))
}
```