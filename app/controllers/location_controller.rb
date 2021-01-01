class LocationController < ApplicationController
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

  def location_params
    params.permit(:cep)
  end
end
