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
    @ambulance = Ambulances::CreateService.new(ambulance_attributes).call
    #@ambulance = Ambulance.new(ambulance_params.merge(hospital_id: hospital.id).except(:hospital_name))

    if @ambulance.save!
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

    if @ambulance.update(ambulance_attributes)
      redirect_to @ambulance
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def hospital
    Hospital.find_by(name: ambulance_params[:hospital_name])
  end

  def ambulance_attributes
    ambulance_params.merge(hospital_id: hospital.id).except(:hospital_name)
  end

  def ambulance_params
    params.require(:ambulance).permit(
      :driver_contact,
      :driver_name,
      :emergency_contact,
      :equipment_list,
      :fuel_level,
      :hospital_name,
      :last_serviced_at,
      :latitude,
      :longitude,
      :mileage,
      :name,
      :registration_number,
      :service_due_at,
      :status,
    )
  end
end
