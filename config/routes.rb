# frozen_string_literal: true

Rails.application.routes.draw do
  # 'resources :client' mapping (REST) routes
  # GET    /client        #=> index
  # GET    /client/1      #=> show
  # GET    /client/new    #=> new
  # GET    /client/1/edit #=> edit
  # PUT    /client/1      #=> update
  # POST   /client        #=> create
  # DELETE /client/1      #=> destroy
  #

  namespace 'api' do
    put 'consultancy/:id', to: 'consultancy#close'

    resources :client, :consultant, :consultancy, :category, :location, only: %i[index create destroy update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
