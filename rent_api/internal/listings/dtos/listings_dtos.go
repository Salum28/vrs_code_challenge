package dtos

import "time"

type CreateListingDto struct {
	Type 	  string 	`json:"type"`
    PriceBrl  float64 	`json:"price_brl"`
    ImagePath string 	`json:"image_path"`
	ZipCode   string 	`json:"zip_code"`
	Street 	  string 	`json:"street"`
	District  string 	`json:"district"`
	City 	  string 	`json:"city"`
	State 	  string 	`json:"state"`
}

type Listings struct {
	Id        int 		`json:"id"`
	Type 	  string 	`json:"type"`
    PriceBrl  float64 	`json:"price_brl"`
    ImagePath string 	`json:"image_path"`
	ZipCode   string 	`json:"zip_code"`
	Street 	  string 	`json:"street"`
	District  string 	`json:"district"`
	City 	  string 	`json:"city"`
	State 	  string 	`json:"state"`
    CreatedAt time.Time `json:"created_at"`
    UpdatedAt time.Time `json:"updated_at"`
    DeletedAt time.Time `json:"deleted_at"`
}