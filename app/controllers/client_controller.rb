# frozen_string_literal: true

class ClientController < ApplicationController
  def index
    render json: Client.all
  end

  def create
    # client = Client.new(name: params[:name])
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

  def update
    client = Client.find(params[:id])
    if client.update(client_params)
      render json: client, status: :ok
    else
      render json: client.errors, status: :unprocessable_entity
    end
  end

  private

  def client_params
    params.permit(:name, :category_id, :location_id)
  end
end
