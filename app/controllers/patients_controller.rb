class PatientsController < ApplicationController
  before_action :get_patient, only: [:show]
  def index
    #Showing first doctor patients list
    @doctor = Doctor.first
    @patients = @doctor.patients.includes(:user)

    render_success(data: { patients: serialize_resource(@patients, PatientSerializer)})
  end

  def show
    render_success(data: { patient: serialize_resource(@patient, PatientSerializer)})
  end

  def create
    patient = Patient.new(patient_params.merge({doctor_id: Doctor.first.id}))
    user = User.new(patient_params[:user_attributes])
    user.role_id = Role.find_by_name('patient').id
    user.resource = patient
    user.registered_on = Time.now
    if patient.save
      render_success(data: {patient: serialize_resource(patient, PatientSerializer)},
                     message: "Created successfully", status: :created)
    else
      render_error(message: "Error in saving", errors: patient.errors,
        status: :unprocessable_entity)
    end
  end

  private

  def get_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit([:past_history, :allergy, :family_history, :notes, user_attributes: [:name, :mobile, :email, :dob, :gender]])
  end
end
