class ConsultantController < ApplicationController
  def index
    render json: Consultant.all
  end

end
