package main

import (
	"reflect"
	"testing"
)

// Test the mergeRanges function
func TestMergeRanges(t *testing.T) {
	tests := []struct {
		name     string
		meetings [][2]int
		expected [][2]int
	}{
		{
			name:     "No overlapping meetings",
			meetings: [][2]int{{0, 1}, {3, 5}, {4, 8}, {10, 12}, {9, 10}},
			expected: [][2]int{{0, 1}, {3, 8}, {9, 12}},
		},
		{
			name:     "All overlapping meetings",
			meetings: [][2]int{{1, 3}, {2, 4}, {3, 5}},
			expected: [][2]int{{1, 5}},
		},
		{
			name:     "No merging needed",
			meetings: [][2]int{{1, 2}, {3, 4}, {5, 6}},
			expected: [][2]int{{1, 2}, {3, 4}, {5, 6}},
		},
		{
			name:     "Single meeting",
			meetings: [][2]int{{1, 10}},
			expected: [][2]int{{1, 10}},
		},
		{
			name:     "Meetings that touch but don't overlap",
			meetings: [][2]int{{1, 2}, {2, 3}, {4, 5}},
			expected: [][2]int{{1, 3}, {4, 5}},
	},
	{
			name:     "Non-overlapping, unordered meetings",
			meetings: [][2]int{{3, 4}, {1, 2}, {5, 6}},
			expected: [][2]int{{1, 2}, {3, 4}, {5, 6}},
	},
	{
			name:     "Meetings with the same start time but different end times",
			meetings: [][2]int{{1, 3}, {1, 2}},
			expected: [][2]int{{1, 3}},
	},
	{
			name:     "Empty meeting list",
			meetings: [][2]int{},
			expected: [][2]int{},
	},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			result := mergeRanges(tt.meetings)
			if !reflect.DeepEqual(result, tt.expected) {
				t.Errorf("mergeRanges(%v) = %v; want %v", tt.meetings, result, tt.expected)
			}
		})
	}
}
