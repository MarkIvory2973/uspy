package main

import "testing"

func TestIn(t *testing.T) {
	slice := []string{"doc", "docx", "ppt", "pptx", "xls", "xlsx"}
	for _, target := range slice {
		if !in(slice, target) {
			t.Errorf("in(%s, %s) = false; want true", slice, target)
		}
	}
}
