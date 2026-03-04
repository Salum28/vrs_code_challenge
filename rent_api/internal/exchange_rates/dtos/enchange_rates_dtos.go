package dtos

import (
    tm "time"
)

type CreateExchangeRateDto struct {
    Brl       float64 	`json:"brl_value"`
    Usd 	  float64 	`json:"usd_value"`
}

type ExchangeRate struct {
	Id        int 		`json:"id"`
    Brl       float64 	`json:"brl_value"`
    Usd 	  float64 	`json:"usd_value"`
    CreatedAt tm.Time   `json:"created_at"`
}