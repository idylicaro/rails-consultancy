Rails.application.routes.draw do
  # 'resources :items' mapping (REST) routes
  # GET    /items        #=> index
  # GET    /items/1      #=> show
  # GET    /items/new    #=> new
  # GET    /items/1/edit #=> edit
  # PUT    /items/1      #=> update
  # POST   /items        #=> create
  # DELETE /items/1      #=> destroy
  
  resources :client, only:[:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
