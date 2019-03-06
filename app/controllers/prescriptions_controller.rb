class PrescriptionsController < ApplicationController

  def index
    @patient = Patient.find(params[:patient_id])
    @prescriptions = @patient.prescriptions.order(created_at: :desc)
  end
end
