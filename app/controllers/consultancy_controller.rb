class ConsultancyController < ApplicationController
  def index
    render json: Consultancy.all
  end

  def create
    client = Client.find(params[:client_id])
    consultant = Consultant.find(params[:consultant_id])

    consultancy = Consultancy.new(client:client,consultant:consultant)
    consultancy.rating = 0;  #todo: remove for ConsultancyRepository

    if consultancy.save
      render json: consultancy, status: :created
    else
      render json: consultancy.errors, status: :unprocessable_entity
    end

  end
end
