package main

import (
	"fmt"
	"sort"
)

func main() {
	// Example meeting times
	meetings := [][2]int{
		{0, 1},
		{3, 5},
		{4, 8},
		{10, 12},
		{9, 10},
	}

	// Merge the meeting times
	merged := mergeRanges(meetings)

	// Output the result
	fmt.Println("Merged meeting times:", merged)
}

// Function to merge meeting ranges
func mergeRanges(meetings [][2]int) [][2]int {
	// Sort the meetings by start time, and then by end time if start times are equal
	if len(meetings) == 0 {
		return [][2]int{}
	}

	sort.Slice(meetings, func(i, j int) bool {
		if meetings[i][0] == meetings[j][0] {
			return meetings[i][1] < meetings[j][1]
		}
		return meetings[i][0] < meetings[j][0]
	})

	// Initialize the merged meetings with the first meeting
	mergedMeetings := [][2]int{meetings[0]}

	// Iterate through the sorted meetings
	for _, currentMeeting := range meetings[1:] {
		lastMergedMeeting := mergedMeetings[len(mergedMeetings)-1]

		// If the current meeting overlaps with the last merged meeting, merge them
		if currentMeeting[0] <= lastMergedMeeting[1] {
			mergedMeetings[len(mergedMeetings)-1][1] = max(lastMergedMeeting[1], currentMeeting[1])
		} else {
			// Otherwise, add the current meeting as is
			mergedMeetings = append(mergedMeetings, currentMeeting)
		}
	}

	return mergedMeetings
}

// Helper function to get the maximum of two integers
func max(x, y int) int {
	if x > y {
		return x
	}
	return y
}
