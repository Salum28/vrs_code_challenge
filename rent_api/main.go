package main

import (
	db "rent_api/internal/database"
	denv "github.com/joho/godotenv"
	vcconfig "rent_api/internal/cep/client"
	routes "rent_api/routes/config"
	health "rent_api/internal/health"
	os "os"
)

func main() {
	denv.Load()
	vcconfig.ConfigCepClient()
	db.Init()

	defer db.DB.Close()

	r := routes.SetupRouter()
	health.AddHealthCheck(r, db.DB)

	r.Run(":" + os.Getenv("PORT"))
}