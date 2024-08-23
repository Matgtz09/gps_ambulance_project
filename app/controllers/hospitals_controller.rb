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
    @hospital = Hospitals::CreateService.new(hospital_params).call

    if @hospital.present?
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

  def destroy
    @hospital = Hospital.find(params[:id])

    if @hospital.present?
      @hospital.destroy

      redirect_to hospitals_path, notice: 'Hospital was successfully deleted.'
    else
      render :destroy, status: :unprocessable_entity
    end
  end

  private

  def hospital_params
    params.require(:hospital).permit(
      :address,
      :capacity,
      :city,
      :country,
      :email_address,
      :emergency_contact,
      :insurance_accepted,
      :latitude,
      :longitude,
      :name,
      :operating_hours,
      :phone_number,
      :specialties,
      :state,
      :title,
      :zip_code,
      :website,
      )
  end
end
