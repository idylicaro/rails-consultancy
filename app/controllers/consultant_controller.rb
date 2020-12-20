class ConsultantController < ApplicationController
  def index
    render json: Consultant.all
  end

  def create
    #consultant = Consultant.new(name: params[:name], rating:0)
    consultant = Consultant.new(consultant_params)
    consultant.rating = 0;  #todo: remove for ConsultantRepository

    if consultant.save
      render json: consultant, status: :created
    else
      render json: consultant.errors, status: :unprocessable_entity
    end

  end

  def destroy
    Consultant.find(params[:id]).destroy!

    head :ok  # obs: aqui tem o rescue que ta la no application_controller
  end

  private

  def consultant_params
    params.permit(:name)
  end
end
