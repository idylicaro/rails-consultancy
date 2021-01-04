class Api::LocationController < ApplicationController
  def index
    render json: Location.all
  end

  def create
    location = Location.new(location_params)

    if location.save
      render json: location, status: :created
    else
      render json: location.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Location.find(params[:id]).destroy!

    head :ok
  end

  def update
    location = Location.find(params[:id])
    if location.update(location_params)
      render json: location, status: :ok
    else
      render json: location.errors, status: :unprocessable_entity
    end
  end

  private

  def location_params
    params.permit(:cep)
  end
end
