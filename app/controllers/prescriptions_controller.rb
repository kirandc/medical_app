class PrescriptionsController < ApplicationController
  before_action :get_patient
  def index
    @prescriptions = @patient.prescriptions.includes(:prescription_drugs).order(created_at: :desc)
    render_success(data: { prescriptions: serialize_resource(@prescriptions, PrescriptionSerializer)})
  end

  def show
    @prescription = @patient.prescriptions.find(params[:id])
    render_success(data: { prescription: serialize_resource(@prescription, PrescriptionSerializer)})
  end

  def create
    prescription = @patient.prescriptions.new(prescription_params.merge({doctor_id: @patient.doctor.id}))
    if prescription.save
      render_success(data: {prescription: serialize_resource(prescription, PrescriptionSerializer)},
                     message: "Created successfully", status: :created)
    else
      render_error(message: "Error in saving", errors: prescription.errors,
        status: :unprocessable_entity)
    end
  end

  private

  def get_patient
    @patient = Patient.find(params[:patient_id])
  end

  def prescription_params
    params.require(:prescription).permit([:complaints, :findings, :instructions, prescription_drugs_attributes: [:drug_name, :instruction, :morning_before_food, :morning_after_food , :afternoon_before_food, :afternoon_after_food, :evening_before_food, :evening_after_food, :night_before_food, :night_after_food, :days]])
  end
end
