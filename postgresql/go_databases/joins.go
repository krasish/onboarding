package main

import (
	"fmt"
	"github.com/jmoiron/sqlx"

)

func PrintActorsWhoHaveNeverBeenInMovie(db *sqlx.DB) {
	query := `SELECT
name
FROM movies.moviestar m
LEFT JOIN movies.starsin s ON m.name = s.starname
WHERE movietitle IS NULL;`

	rows, err := db.Query(query)
	if err != nil {
		panic(err)
	}
	var name string
	for rows.Next() {
		rows.Scan(&name)
		fmt.Println(name)
	}

}

func main() {
	db, err := GetDBInstance("localhost", 5432, "user1", "password1", "onboarding")
	defer db.Close()
	if err != nil {
		panic(err)
	}
	PrintActorsWhoHaveNeverBeenInMovie(db)

}