class ClientController < ApplicationController
  def index
    render json: Client.all
  end

  def create
    #client = Client.new(name: params[:name])
    client = Client.new(client_params)

    if client.save
      render json: client, status: :created
    else
      render json: client.errors, status: :unprocessable_entity
    end

  end

  def destroy
    Client.find(params[:id]).destroy!

    head :ok  # obs: aqui tem o rescue que ta la no application_controller
  end


  private

  def client_params
    params.permit(:name)
  end
end
