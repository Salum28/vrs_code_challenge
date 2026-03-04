package routes

import (
	gin "github.com/gin-gonic/gin"
	ctr "rent_api/internal/exchange_rates/controllers"
)

func ExchangeRatesRoutes(r *gin.RouterGroup) {
	exchangeRates := r.Group("/exchange-rates")
	{
		exchangeRates.GET("/get-current-exchange-rate", ctr.HandlerGetCurrentExchangeRate)
		exchangeRates.POST("/create-exchange-rate", ctr.HandlerWriteExchangeRate)
	}
}
