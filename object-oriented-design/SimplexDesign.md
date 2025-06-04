# Simplex - Software Design 

Version 1  
Prepared by Antoine Wimberly and Jay Park
Simplex
June 4, 2025

Table of Contents
=================
* [Revision History](#revision-history)
* 1 [Product Overview](#1-product-overview)
* 2 [Use Cases](#2-use-cases)
  * 2.1 [Use Case Model](#21-use-case-model)
  * 2.2 [Use Case Descriptions](#22-use-case-descriptions)
    * 2.2.1 [Actor: User](#221-actor-user)
* 3 [UML Class Diagram](#3-uml-class-diagram)
* 4 [Database Schema](#4-database-schema)

## Revision History
| Name | Date    | Reason For Changes  | Version   |
| ---- | ------- | ------------------- | --------- |
|  Al  | 6/04    | Initial Design      |    1      |
|      |         |                     |           |
|      |         |                     |           |

## 1. Product Overview
Simplex is a simple, easy to use web app with the goal allowing any user to browse songs. Users have the choice of being both a customer and artist, with the ability to broswer, listen, download, upload, write and respone to reviews.

## 2. Use Cases
### 2.1 Use Case Model
![Use Case Model](https://github.com/AJ000-sys/csc340-group-4/raw/main/object-oriented-design/use-case-model.png)

### 2.2 Use Case Descriptions

#### 2.2.1 Actor: User
##### 2.2.1.1 Sign Up
A user can sign up to create their profile with their name, email, and password.
##### 2.2.1.2 Log In
A user shall be able to sign in using their registred email and password. After logging in, the user shall be presented with the home screen.
##### 2.2.1.3 Update Profile
A user shall be to modify their profile by going to their profile page. They can change their email, password, and profile picture.
##### 2.2.1.4 Upload Music
The user shall be able to upload new music. They would provide the song title, , genre and choose a file.
##### 2.2.1.5 Manage Song
A user shall be able update or remove any song.
##### 2.2.1.8 Browse Song
A user shall be able to all avaliable song. They can do this from the home page or using a search function. They can also filter song by title, genre, or artist. They will also be able to select one song and view more details.


## 3. UML Class Diagram
![UML Class Diagram](https://github.com/AJ000-sys/csc340-group-4/blob/main/object-oriented-design/Class%20Diagram.png)
## 4. Database Schema
![UML Class Diagram](https://github.com/uncg-csc340/su25-team0/blob/main/object-oriented-design/database-schema.png)