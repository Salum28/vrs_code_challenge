package controllers

import (
	http "net/http"
	dto "rent_api/internal/exchange_rates/dtos"
	sv "rent_api/internal/exchange_rates/services"
	hprs "rent_api/internal/helpers"
	gin "github.com/gin-gonic/gin"
)

func HandlerWriteExchangeRate(c *gin.Context) {
	var exchangeRateDto dto.CreateExchangeRateDto

	err := c.BindJSON(&exchangeRateDto)

	if err != nil {
		hprs.FeedErrorToResponse("(C) Error while binding data from request body: ", err, c)
		return
	}

	err = sv.ServiceWriteExchangeRate(&exchangeRateDto)

	if err != nil {
		hprs.FeedErrorToResponse("(C) Error while writing exchange rate: ", err, c)
		return
	}

	c.JSON(http.StatusCreated, gin.H{"message": "Exchange Rate created successfully!"})
}

func HandlerGetCurrentExchangeRate(c *gin.Context) {
	exchangeRate, err := sv.ServiceGetCurrentExchangeRate()

	if err != nil {
		hprs.FeedErrorToResponse("(C) Error while getting current exchange rate: ", err, c)
		return
	}

	c.JSON(http.StatusOK, exchangeRate)
}