package controllers

import (
	http "net/http"
	dto "rent_api/internal/listings/dtos"
	sv "rent_api/internal/listings/services"
	hprs "rent_api/internal/helpers"
	gin "github.com/gin-gonic/gin"
)

func HandlerWriteListing(c *gin.Context) {
	var createListingDto dto.CreateListingDto

	err := c.BindJSON(&createListingDto)

	if err != nil {
		hprs.FeedErrorToResponse("(C) Error while binding data from request body: ", err, c)
		return
	}

	err = sv.ServiceWriteListing(&createListingDto)

	if err != nil {
		hprs.FeedErrorToResponse("(C) Error while writing listing: ", err, c)
		return
	}

	c.JSON(http.StatusCreated, gin.H{"message": "Exchange Rate created successfully!"})
}

func HandlerGetPaginatedListings(c *gin.Context) {
	var paginationDto hprs.PaginationModel

	err:= c.BindJSON(&paginationDto)

	if err != nil {
		hprs.FeedErrorToResponse("(C) Error while binding data from request body: ", err, c)
		return
	}

	listings, err := sv.ServiceGetPaginatedListings(paginationDto)

	if err != nil {
		hprs.FeedErrorToResponse("(C) Error while getting paginated listings: ", err, c)
		return
	}

	c.JSON(http.StatusOK, listings)
}