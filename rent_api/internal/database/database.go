package database
 import (
	sql "database/sql"
	fmt "fmt"
	log "log"
	os 	"os"
	_  	"github.com/lib/pq"
 )

 var DB *sql.DB

 func Init() {
	err := Connect()
	if err != nil {
		log.Fatal("Failed to connect in database: ", err)
	}
 }

 func Connect() error {
	psqlInf := fmt.Sprintf(`
	host=%s
	port=%s
	user=%s
	password=%s
	dbname=%s
	sslmode=disable`,
		os.Getenv("DB_HOST"),	
		os.Getenv("DB_PORT"),	
		os.Getenv("DB_USER"),	
		os.Getenv("DB_PASSWORD"),	
		os.Getenv("DB_NAME"),	
	)

	db, err := sql.Open("postgres", psqlInf)
	if err != nil {
		return err
	}

	if err = db.Ping(); err != nil {
		return err
	}

	DB = db

	return nil
 }