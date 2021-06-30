# World of Warcraft characters api

Flask API for characters management

## How to run
- install dependencies `pip install -r requirements`
- export Flask app name
    | shell      | script                   |
    | ---------- | ------------------------ |
    | bash       | `export FLASK_APP=app`   |
    | cmd        | `set FLASK_APP=app`      |
    | powershell | `$env:FLASK_APP = "app"` |
- run app `flask run`

## Routes

### User Routes

| Route           | Methods | Description                         |
| :-------------- | :------ | :---------------------------------- |
| /users/register | POST    | Registers user                      |
| /users/login    | POST    | Logins user and generates token     |
| /users/logout   | DELETE  | Revokes user token logging user out |

### Character Routes

| Route                                  | Methods     | Description                                                                      |
| :------------------------------------- | :---------- | :------------------------------------------------------------------------------- |
| /characters                            | POST, GET   | - GET - fetches all characters </br> - POST - adds character to database         |
| /characters/\<userId\>                 | GET         | Fetches all characters which belong to user                                      |
| /characters/\<userId\>/\<characterId\> | GET, DELETE | - GET - fetches specified character </br> - DELETE - removes specified character |

## Database Schema
DDL script is located in `database/create.sql`