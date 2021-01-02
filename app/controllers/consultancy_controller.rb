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
    consultant = Consultant.find(consultancy.consultant_id)
    consultancy.end_date = DateTime.current
    consultancy.closed = true
    consultancy.rating = params[:rating]
    consultant.rating = calculate_rating(consultant.rating,consultancy.rating,consultant.total_consultancies + 1)

    consultant.total_consultancies = consultant.total_consultancies + 1

    #todo: use section for finish this operation
    if consultant.save
      if consultancy.save
        render json: consultancy, status: :ok
      else
        render json: consultancy.errors, status: :unprocessable_entity
      end
    else
      render json: consultant.errors, status: :unprocessable_entity
    end

  end
  private

  def calculate_rating(old_score, new_score, count_consultancies)
    (old_score + ((new_score - old_score)/count_consultancies)).floor(2)
  end

end
