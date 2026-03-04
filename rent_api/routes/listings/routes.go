package routes

import (
	gin "github.com/gin-gonic/gin"
	ctr "rent_api/internal/listings/controllers"
)

func ListingRoutes(r *gin.RouterGroup) {
	listings := r.Group("/listings")
	{
		listings.POST("/get-listings", ctr.HandlerGetPaginatedListings)
		listings.POST("/create-listing", ctr.HandlerWriteListing)
	}
}
