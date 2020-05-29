package main

import (
	"fmt"
	"github.com/jmoiron/sqlx"
	"time"
)

type Actor struct {
	Name     string    `db:"name"`
	Gender   string    `db:"gender"`
	Address  string    `db:"address"`
	Birthday time.Time `db:"birthdate"`
}

func GetAddress(db *sqlx.DB, studio string) string {
	query := `SELECT address FROM movies.studio WHERE name = $1`
	var result string
	db.QueryRow(query, studio).Scan(&result)

	return result
}

func GetActorsInFilmsByKeywordAndYear(db *sqlx.DB, keyword string, year int) ([]string, error){
	query := `SELECT
starname AS name
FROM movies.starsin
WHERE movietitle LIKE $1
AND movieyear = $2;`
	rows, err := db.Queryx(query, keyword, year)
	if err != nil {
		return nil, err
	}
	var actors []string = make([]string, 5)

	count := 0
	for rows.Next() {
		err = rows.Scan(&actors[count])
		if err != nil {
			return nil, err
		}
		count++
	}
	rows.Close()
	if err =rows.Err(); err != nil {
		return nil, err
	}
	return actors, nil
}

//Gets all actors who live in returned as a Slice
//TODO: Ask about trailing withespaces
func GetActorsInLivingIn(db *sqlx.DB, address string) ([]Actor, error) {
	var actors []Actor

	query := `SELECT name, gender, address, birthdate
FROM movies.moviestar
WHERE address = $1`

	err := db.Select(&actors, query, address)
	if err != nil {
		return nil, err
	}
	return actors, nil

}

func main(){
	db, err := GetDBInstance("localhost", 5432, "user1", "password1", "onboarding")
	defer db.Close()
	if err != nil {
		fmt.Print(err)
	}

	// TASK 1
	//fmt.Println(GetAddress(db, "MGM"))

	// TASK3

	actors, err := GetActorsInFilmsByKeywordAndYear(db, "%Wars%", 1977)
	if err != nil {
		fmt.Println(err)
	}
	for _, actor := range actors {
		fmt.Println(actor)
	}

	// TASK 5

	//actors, err := GetActorsInLivingIn(db,"Baldwin Av.")
	//if err != nil {
	//	fmt.Println(err)
	//}
	//
	//for _, actor := range actors {
	//	fmt.Println(len(actor.Name))
	//}
}
