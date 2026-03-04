package config

import (
	gin "github.com/gin-gonic/gin"
	ltns "rent_api/routes/listings"
	exrts "rent_api/routes/exchange_rates"
	cep "rent_api/routes/cep"
)


func CORSMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		c.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
		c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-With")
		c.Writer.Header().Set("Access-Control-Allow-Methods", "POST, OPTIONS, GET, PUT, DELETE, PATCH")

		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(204)
			return
		}

		c.Next()
	}
}

func SetupRouter() *gin.Engine {
	router := gin.Default()

	router.RedirectTrailingSlash = false
	router.RedirectFixedPath = false

	router.Use(CORSMiddleware())

	router.SetTrustedProxies([]string{
		"localhost",
		"127.0.0.1",
	})

	api := router.Group("/api/v1") 
	{
		ltns.ListingRoutes(api)
		exrts.ExchangeRatesRoutes(api)
		cep.CepRoutes(api)
	}

	return router
}