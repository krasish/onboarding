package main

import (
	"fmt"
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
)

func GetDBInstance(host string, port int, user, password, database string) (db *sqlx.DB, err error) {
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, database)


	db, err = sqlx.Open("postgres", psqlInfo)

	return
}
