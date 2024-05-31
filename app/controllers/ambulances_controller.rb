class AmbulancesController < ApplicationController
  def index
    @ambulance = Ambulance.all
  end

  def show
    @ambulance = Ambulance.find(params[:id])
  end

  def new
    @ambulance = Ambulance.new
  end

  def create
    @ambulance = Ambulance.new(ambulance_params)

    if @ambulance.save
      redirect_to @ambulance
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ambulance = Ambulance.find(params[:id])
  end

  def update
    @ambulance = Ambulance.find(params[:id])

    if @ambulance.update(ambulance_params)
      redirect_to @ambulance
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def ambulance_params
    params.require(:ambulance).permit(
      number:,
      hospital_id:,
      patient_id:,
      last_known_lat:,
      last_known_long:,
      distance_from_hospital:,
      phone_number:
    )
  end
end
