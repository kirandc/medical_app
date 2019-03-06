class PrescriptionsController < ApplicationController
  before_action :get_patient
  def index
    @prescriptions = @patient.prescriptions.order(created_at: :desc)
  end

  def show
    @prescription = @patient.prescriptions.find(params[:id])
    @prescription_drugs = @prescription.prescription_drugs.order(created_at: :asc)
  end

  private
  def get_patient
    @patient = Patient.find(params[:patient_id])
  end
end
