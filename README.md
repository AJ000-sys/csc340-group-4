## Title
Music Subscription Service

## Team Members
Antoine Wimberly

Jay Park

## Description
This app offers the customer music related services such as browsing, listening, and downloading. Along with that, artist can register to post their own music, and view how many people listen to their songs and their revenue, and reply to commentors.

## App Functions
1. Customer (Music Student/Fan)

    1. Create/modify customer profile - Register profile.

    2. View available services - Browse, listen, and download music.

    3. Subscribe to available services - Subscribe to artists.

    4. Write reviews for subscribed services - rate and give feedback/comments.

2. Provider (Artist):

    1. Create/modify/remove provider profile – Register as a artist.

    2. Create services - Post available music, and/or albums/singles.

# csc340-group-4-Simplex
## Installation
- Get the project
    - clone
        ```
      git clone https://github.com/AJ000-sys/csc340-group-4.git
        ```
    - OR download zip.
- Open the project in VS Code.
- This project is built to run with jdk 21.
- [Dependencies](https://github.com/AJ000-sys/csc340-group-4/blob/616c234f1e520e20cd559bb82a56d36204a43d76/backend-api/pom.xml#L32) to JPA, Postgres, Freemarker, and Security, in addition to the usual. JPA handles the persistence, Postgres is the database to be used, FreeMarker generates HTML templates.
- [`/src/main/resources/application.properties`](https://github.com/AJ000-sys/csc340-group-4/blob/616c234f1e520e20cd559bb82a56d36204a43d76/backend-api/src/main/resources/application.properties#L1) file  is the configuration for the app.
 - You MUST have the database up and running before running the project!
    - Login to your neon.tech account.
    - Locate your database project.
    - On the project dashboard, click on "Connect" and select Java.
    - Copy the connection string provided.
    - Paste it as a value for the property `spring.datasource.url`. No quotation marks.
- Build and run the main class. You should see a new table created in the Neon database.
-You can use either http://localhost:8080/ or http://localhost:8080/user/register to get started.