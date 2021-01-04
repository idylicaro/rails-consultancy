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

  ### Consultancy 
  - GET    /api/consultancy
    > (index) #=> get all consultancy in a JSON
  - PUT    /api/consultancy/:id
    > (close) #=> this route finish a consultancy 
  - POST   /api/consultancy
    > (create) #=> create a new consultancy (required: client_id, consultant_id)
  - DELETE /api/consultancy/:id
    > (destroy) #=> delete the consultancy

  ### Client 
  - GET    /api/client
    > (index) #=> get all clients in a JSON
  - PUT    /api/client/:id
    > (update) #=> update attributes of client (permited update: name, category_id, location_id)
  - POST   /api/client
    > (create) #=> create a new client (required: name, category_id, location_id)
  - DELETE /api/client/:id
    > (destroy) #=> delete the client
  
  ### Consultant
  - GET    /api/consultant
    > (index) #=> get all consultants in a JSON
  - PUT    /api/consultant/:id
    > (update) #=> update attributes of consultant (permited update: name)
  - POST   /api/consultant
    > (create) #=> create a new consultant (required: name)
  - DELETE /api/consultant/:id
    > (destroy) #=> delete the consultant
  
  ### Category
  - GET    /api/category
    > (index) #=> get all category in a JSON
  - PUT    /api/category/:id
    > (update) #=> update attributes of category (permited update: name)
  - POST   /api/category
    > (create) #=> create a new category (required: name)
  - DELETE /api/category/:id
    > (destroy) #=> delete the category
  
  ### Location
  - GET    /api/location
    > (index) #=> get all location in a JSON
  - PUT    /api/location/:id
    > (update) #=> update attributes of location (permited update: cep)
  - POST   /api/location
    > (create) #=> create a new location (required: cep)
  - DELETE /api/location/:id
    > (destroy) #=> delete the location
