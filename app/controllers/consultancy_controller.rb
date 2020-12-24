class ConsultancyController < ApplicationController
  def index
    render json: Consultancy.all
  end

  def create
    client = Client.find(params[:client_id])
    consultant = Consultant.find(params[:consultant_id])

    consultancy = Consultancy.new(client:client,consultant:consultant)
    consultancy.rating = 0;  #todo: remove for ConsultancyRepository

    #Todo: add add current datatime in start start_date

    if consultancy.save
      render json: consultancy, status: :created
    else
      render json: consultancy.errors, status: :unprocessable_entity
    end

  end

  def destroy
    Consultancy.find(params[:id]).destroy!

    head :ok  # obs: aqui tem o rescue que ta la no application_controller
  end

  #todo: create close Consultancy action
  # - [] calculate rating
  # - [] add end_date
end
