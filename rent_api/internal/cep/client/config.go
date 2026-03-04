package client

import (
	os "os"
)

type config struct {
	ViaCepBaseURL string
}

var Env = config{}

func ConfigCepClient() {
	Env = config{
		ViaCepBaseURL: os.Getenv("VIACEP_BASE_URL"),
	}
}