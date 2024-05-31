class HospitalsController < ApplicationController
  def index
    @hospital = Hospital.all
  end

  def show
    @hospital = Hospital.find(params[:id])
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)

    if @hospital.save
      redirect_to @hospital
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])

    if @hospital.update(hospital_params)
      redirect_to @hospital
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def hospital_params
    params.require(:hospital).permit(
      :title,
      :name,
      :address,
      :city,
      :state,
      :country,
      :phone_number,
      :email_address,
      :emergency_contact,
      :capacity,
      :specialties,
      :operating_hours,
      :insurance_accepted,
      :website,
      :latitude,
      :longitude
      )
  end
end
