class PatientController < ApplicationController
  def index
    @patient = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to @patient
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  def patient_params
    params.require(:patient).permit(
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