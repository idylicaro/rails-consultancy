# rails-consultancy

## business
- An Consultancy have a client and a consultant, each consultancy have a rating, so each consultant have a rating that increment a each closed consultancy.
- The client has a location and this location is unique and the client belong to an category.
- The category can have many clients.

## how to get started
``` 
#if ocurred an error with webpack use 'rails webpacker:install'
rails db:setup
rails db:create
rails db:migrate
#if not migrated on test db, use 'rails db:migrate RAILS_ENV=test'
rails s
```
## Routes

