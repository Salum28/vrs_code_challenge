package controllers

import (
	http "net/http"
	dto "rent_api/internal/cep/dtos"
	sv "rent_api/internal/cep/services"
	hprs "rent_api/internal/helpers"
	gin "github.com/gin-gonic/gin"
)

func HandlerFetchCep(c *gin.Context) {
	var rqstDto dto.CepRequestDto

	err := c.BindJSON(&rqstDto)

	if err != nil {
		hprs.FeedErrorToResponse("(C) Error while binding data from request body: ", err, c)
		return
	}

	adrs, err := sv.ServiceFetchCep(rqstDto)

	if err != nil {
		hprs.FeedErrorToResponse("(C) Error while fetching cep: ", err, c)
		return
	}

	c.JSON(http.StatusOK, adrs)
}