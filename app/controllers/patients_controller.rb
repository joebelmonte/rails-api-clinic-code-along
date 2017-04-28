class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :destroy, :update]

  def index
    @patients = Patient.all
    render json: @patients
  end

  def show
    render json: @patient
  end

  def update
    if @patient.update(patient_params) # We need to protect ourselves from what users are submitting.
      head :no_content
    else
      render json: @patient.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    head :no_content
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name) #says first key has to be a patient.  If they send us bad stuff, it will filter out anything that doesn't match this criteria.
  end
end
