package health

import (
	"database/sql"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

type HealthResponse struct {
	Status    string    `json:"status"`
	Timestamp time.Time `json:"timestamp"`
	Version   string    `json:"version"`
	Database  string    `json:"database"`
}

func AddHealthCheck(router *gin.Engine, db *sql.DB) {
	router.GET("/health", func(c *gin.Context) {
		dbStatus := "connected"

		if db != nil {
			if err := db.Ping(); err != nil {
				dbStatus = "disconnected"
			}
		} else {
			dbStatus = "not_configured"
		}

		response := HealthResponse{
			Status:    "healthy",
			Timestamp: time.Now(),
			Version:   "1.0.0",
			Database:  dbStatus,
		}

		// Se banco estiver desconectado, retorna status 503
		if dbStatus != "connected" {
			c.JSON(http.StatusServiceUnavailable, response)
			return
		}

		c.JSON(http.StatusOK, response)
	})
}