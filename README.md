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
  - GET    /consultancy
    > (index) #=> get all consultancy in a JSON
  - PUT    /consultancy/:id
    > (close) #=> this route finish a consultancy 
  - POST   /consultancy
    > (create) #=> create a new consultancy (required: client_id, consultant_id)
  - DELETE /consultancy/:id
    > (destroy) #=> delete the consultancy

  ### Client 
  - GET    /client        #=> index     #=> get all clients in a JSON
  - PUT    /client/:id    #=> update    #=> update attributes of client (permited update: name, category_id, location_id)
  - POST   /client        #=> create    #=> create a new client (required: name, category_id, location_id)
  - DELETE /client/:id    #=> destroy   #=> delete the client
  
  ### Consultant
  - GET    /consultant        #=> index     #=> get all consultants in a JSON
  - PUT    /consultant/:id    #=> update    #=> update attributes of consultant (permited update: name)
  - POST   /consultant        #=> create    #=> create a new consultant (required: name)
  - DELETE /consultant/:id    #=> destroy   #=> delete the consultant
  
  ### Category
  - GET    /category        #=> index     #=> get all category in a JSON
  - PUT    /category/:id    #=> update    #=> update attributes of category (permited update: name)
  - POST   /category        #=> create    #=> create a new category (required: name)
  - DELETE /category/:id    #=> destroy   #=> delete the category
  
  ### Location
  - GET    /location        #=> index     #=> get all location in a JSON
  - PUT    /location/:id    #=> update    #=> update attributes of location (permited update: cep)
  - POST   /location        #=> create    #=> create a new location (required: cep)
  - DELETE /location/:id    #=> destroy   #=> delete the location
