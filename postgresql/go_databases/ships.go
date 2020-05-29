package main

import (
	"fmt"
	"github.com/jmoiron/sqlx"
)

type Class struct {
	Name string
	Type string
	Country string
	NumGuns int
	Bore float64
	Displacement int
}

type Ship struct {
	Name     string
	Launched int
	CLass Class
}

func GetShipsWithTheirClasses(db *sqlx.DB ) ([]Ship, error) {
	var ships []Ship = make([]Ship, 33)
	query := `SELECT  s.name,
	                    s.launched, 
						cl.type  "class.type",
						cl.country  "class.country", 
						cl.numguns  "class.numguns",
						cl.bore  "class.bore",
						cl.displacement "class.displacement"
				FROM ships.ships s 
                JOIN ships.classes cl ON s.class = cl.class`
	err := db.Select(&ships, query)
	if err != nil {
		return nil, err
	}
	return ships, nil
}

func main() {
	db, err := GetDBInstance("localhost", 5432, "user1", "password1", "onboarding")
	defer db.Close()
	if err != nil {
		panic(err)
	}

	ships, err := GetShipsWithTheirClasses(db)
	if err != nil {
		panic(err)
	}

	for _, ship := range ships {
			fmt.Println(ship)
	}

}