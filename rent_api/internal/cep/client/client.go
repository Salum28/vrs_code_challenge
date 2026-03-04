package client


import (
	http "net/http"
	tm "time"
)

var Client = &http.Client{
	Timeout: 5 * tm.Second,
}