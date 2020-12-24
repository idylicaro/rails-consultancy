class ConsultancyController < ApplicationController
  def index
    render json: Consultancy.all
  end
end
