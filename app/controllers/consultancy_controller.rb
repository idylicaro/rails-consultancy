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

  def close
    consultancy = Consultancy.find(params[:id])
    consultancy.end_date = DateTime.current
    consultancy.rating = params[:rating]
    consultancy.closed = true
    if consultancy.save
      render json: consultancy, status: :ok
    else
      render json: consultancy.errors, status: :unprocessable_entity
    end
  end

  #todo: create close Consultancy action
  # - [] calculate rating
end
