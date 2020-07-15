# README

# Getting Started:

Clone repository into local machine by running 

```
git clone git@github.com:SantiagoSalazarPavajeau/young_papas_hobbies.git
```

Cd into project directory and run 

```
rails db:migrate
rails db:seed
rails server
```

The app should be running in your local environment at http://localhost:3000/.

This project uses Rails 6.0.2.2 and ruby 2.6.1p33. 

The Gemfile contains the standard dependencies for a rails app and some added gems include omniauth, and bcrypt.

# Young Papas Hobbies

Is a website that allows for documentation of hobbies and projects within those hobbies.

# Features

Some of the features include complete CRUD for Projects and limited for Users,  and Hobbies. The objects are saved in the Database through ORM using ActiveRecord and rails migrations initialize tables and modifications. 

Ruby on Rails REST HTTP requests are implemented using Rails MVC model.


