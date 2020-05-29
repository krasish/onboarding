package main

import (
	"fmt"
	"github.com/jmoiron/sqlx"
	"sync"
	"time"
)

func InsertActor(db *sqlx.DB, name string, birthdate time.Time, address, gender string) {
	var actress = Actor{
		Name:     name,
		Gender:   gender,
		Address:  address,
		Birthday: birthdate,
	}
	query := `INSERT INTO movies.moviestar(name,gender, address, birthdate)
	VALUES (:name, :gender, :address, :birthdate);`

	_, err := db.NamedExec(query , actress)
	if err != nil {
		panic(err)
	}
}

func CheckErr(err error){
	if err != nil {
		panic(err)
	}
}

//TODO: ASK ABOUT TOO MANY ERRORS
func DeleteActor(db *sqlx.DB, name string, wg *sync.WaitGroup) {
	defer wg.Done()

	query := `DELETE FROM movies.moviestar WHERE name = $1`
	tx, err := db.Begin()
	CheckErr(err)
	exec, err := tx.Exec(query, name)
	CheckErr(err)
	affected, err := exec.RowsAffected()
	CheckErr(err)
	tx.Commit()
	fmt.Printf("Deleted %d rows\n", affected)
}
func main1() {
	db, err := GetDBInstance("localhost", 5432, "user1", "password1", "onboarding")
	defer db.Close()
	CheckErr(err)
	var (
		actress1 string = "Ivana Ivanova"
		actress2 string = "Mariq Marinova"
	)

	birthday := time.Date(1989, 2, 25, 12, 30, 0, 0, time.Local)
	InsertActor(db, actress1, birthday, "Nqkude v Liulin", "F")
	InsertActor(db, "Mariq Marinova", birthday, "", "F")

	var wg sync.WaitGroup
	wg.Add(2)

	go DeleteActor(db, actress2, &wg)
	go DeleteActor(db, actress1, &wg)

	wg.Wait()
}