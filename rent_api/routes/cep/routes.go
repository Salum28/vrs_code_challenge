package cep

import (
	gin "github.com/gin-gonic/gin"
	ctr "rent_api/internal/cep/controllers"
)

func CepRoutes(r *gin.RouterGroup) {
	cep := r.Group("/cep")
	{
		cep.POST("/get-cep", ctr.HandlerFetchCep)
	}
}