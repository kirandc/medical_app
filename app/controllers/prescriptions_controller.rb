class PrescriptionsController < ApplicationController
  before_action :get_patient
  def index
    @prescriptions = @patient.prescriptions.order(created_at: :desc)
    render_success(data: { prescriptions: serialize_resource(@prescriptions, PrescriptionSerializer)})
  end

  def show
    @prescription = @patient.prescriptions.find(params[:id])
    render_success(data: { prescription: serialize_resource(@prescription, PrescriptionSerializer)})
  end

  def create
    prescription = @patient.prescriptions.new(prescription_params.merge({doctor_id: @patient.doctor.id}))
    if prescription.save!
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
    params.require(:prescription).permit([:complaints, :findings, :instructions])
  end
end
