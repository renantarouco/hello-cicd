package main

import "testing"

func TestGetHello(t *testing.T) {
	if getHello() != "hello" {
		t.Error("wrong hello message")
	}
}
