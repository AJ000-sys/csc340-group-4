<<<<<<< HEAD
# Simplex - Software Design 

Version 1  
Prepared by Antoine Wimberly and Jay Park\
Simplex\
=======
# Class Connect - Software Design 

Version 1  
Prepared by Antoine Wimberly and Jay Park\
Class Connect\
>>>>>>> de48bfe1f666a683fefdda15c16cd3c508fc0fcd
June 4, 2025

Table of Contents
=================
* [Revision History](#revision-history)
* 1 [Product Overview](#1-product-overview)
* 2 [Use Cases](#2-use-cases)
  * 2.1 [Use Case Model](#21-use-case-model)
  * 2.2 [Use Case Descriptions](#22-use-case-descriptions)
<<<<<<< HEAD
    * 2.2.1 [Actor: User](#221-actor-user)
=======
    * 2.2.1 [Actor: User](#221-actor-teacher)
>>>>>>> de48bfe1f666a683fefdda15c16cd3c508fc0fcd
* 3 [UML Class Diagram](#3-uml-class-diagram)
* 4 [Database Schema](#4-database-schema)

## Revision History
| Name | Date    | Reason For Changes  | Version   |
| ---- | ------- | ------------------- | --------- |
<<<<<<< HEAD
|  Al  | 6/04    | Initial Design      |    1      |
=======
|  Al  | 5/27    | Initial Design      |    1      |
>>>>>>> de48bfe1f666a683fefdda15c16cd3c508fc0fcd
|      |         |                     |           |
|      |         |                     |           |

## 1. Product Overview
<<<<<<< HEAD
Simplex is a simple, easy to use web app with the goal allowing any user to browse songs. Users have the choice of being both a customer and artist, with the ability to broswer, listen, download, upload, write and respone to reviews.
=======
Class Connect is a simple, comprehensive, easy to use web app with the goal of providing classes to students in various fields. Students and teachers make use of the centralized platform to meet their needs. Teachers create and publish classes, students sign up for any available classes that they are interested in.
>>>>>>> de48bfe1f666a683fefdda15c16cd3c508fc0fcd

## 2. Use Cases
### 2.1 Use Case Model
![Use Case Model](https://github.com/uncg-csc340/su25-team0/blob/main/object-oriented-design/use-case-model.png)

### 2.2 Use Case Descriptions

<<<<<<< HEAD
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

=======
#### 2.2.1 Actor: Teacher
##### 2.2.1.1 Sign Up
A teacher can sign up to create their profile with their name, email, password, and bio. Emails must be unique.
##### 2.2.1.2 Log In
A teacher shall be able to sign in using their registred email and password. After logging in, the teacher shall be directed their dashboard where they see an overview of their classes and stats.
##### 2.2.1.3 Update Profile
A teacher shall be to modify their profile by going to their profile page. They can change their email, password, profile picture, and biography.
##### 2.2.1.4 Create Class
The teacher shall be able to create a new class listing. They would provide a class name, code, description, and schedule. This class will be created to be associated with only this teacher.
##### 2.2.1.5 Manage Class Content
A teacher shall be able to add and remove class assignments and announcements, as well as assign grades to their students.
##### 2.2.1.6 Sign Up
A student can sign up to create their profile with their name, email, password, and bio. Emails must be unique.
##### 2.2.1.7 Log In
A teacher shall be able to sign in using their registred email and password. After logging in, the student shall be directed their dashboard where they see an overview of their classes and stats.
##### 2.2.1.8 Browse Classes
A student shall be able to view available classes. They can do this from the home page or using a search function. They can also filter classes by name, subject, or teacher. They will also be able to select one class and view more details.
##### 2.2.1.9 Drop Class
A student may drop/unregister for a class from the class page.
>>>>>>> de48bfe1f666a683fefdda15c16cd3c508fc0fcd

## 3. UML Class Diagram
![UML Class Diagram](https://github.com/uncg-csc340/su25-team0/blob/main/object-oriented-design/class-diagram.png)
## 4. Database Schema
![UML Class Diagram](https://github.com/uncg-csc340/su25-team0/blob/main/object-oriented-design/database-schema.png)