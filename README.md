# README

* Ruby version 2.7.2

* Rails version 6.1.4

* Database: POSTGRES

* Database creation
  In the root folder, go to config/database.sample.yml, edit the username and password with the postgresql credentials on your local machine,
  feel free to rename the database  'chat_app_development' to any name suitable,
  then rename the file database.sample.yml to database.yml

* Database initialization
  After setting up database.yml file, run 'rails db:create' to create the database, the development and test DBs will be created after running the command

* How to run the test suite
  RSpec is the test suite, run 'rspec spec' to run the spec files.

* Running Application
  Run 'rails s' to start the server

* App Structure
  This is an api based application, hence Postman or curl can be used to make and receive request
```
  Major Endpoints: 

  User
  Verb: POST
  url: localhost:3000/api/signup
  sample payload : 
  {
    "user": {
        "email": "user@gmail.com",
        "password": "123456"
    }
}

  url: localhost:3000/api/login
  Verb: POST
  sample payload:
  {
    "user": {
        "email": "created_user@test.com",
        "password": "123456"
    }
  }
  PS: A bearer token is returned after a successful login, this token is needed for authentication for making request

  Group
  Verb: POST
  url: localhost:3000/api/groups
  Bearer Token is Needed
  sample payload
  {
    "group": {
        "name": "Group Name",
        "description": "Group Description"
    }
  }
  PS: A logged in user is needed to create a group, the user is assigned the admin of the group after creation.
  
  Name: User Join Group
  Verb: POST
  url: localhost:3000/api/groups/group_id/join_group
  Bearer Token is Needed

  PS: A logged in user is required to complete this request


  Name: Get All Groups
  Verb: GET
  url: localhost:3000/api/groups
  Bearer Token is needed


  Message
  Verb: POST
  url: localhost:3000/api/messages
  Bearer Token is needed
  sample payload
  {
    "message": {
        "body": "This is a message from dani",
        "group_id": 1

    }
  }
  PS: group_id is needed if the message is meant for a specific group, else it must be ignored

```

SELECTED FEATURES

The features I implemented are:
1. As a consumer of the API, I can persist my chat messages
2. As a consumer of the API, I can see the list of all the available channels

NOTE: In other to properly implement the features above, I partially implemented some other features such as
1. As a consumer of the API, I can persist messages in specific channels I join
2. A user who creates a group automatically becomes the admin of the group
3. A user who joins a group becomes a member

POSSIBLE NEXT STEPS

The steps I could have implemeneted includes:
Aside from the other features which I did not implement, I would have done the following,
1. Add restrictions so user can only manage resources relating to them, e.g a user can only read messages in a group where the user is a member or an admin.
2. A group admin is expected to confirm or reject the application of a user to join a group
3. A user should be able to leave a group

ASSUMPTIONS

I assumed the user feature allows a user to login and logout so I implemented authentication and authorization using devise and devise-jwt gems.
I assumed each group name is unique.
I implemented a role based system using rolify gem, so a user is either a member or an admin of a group.
I assumed the app is not populated with groups, i.e groups have to be created by users.
