class DrugRemindersController < ApplicationController
  def index
    @patient = Patient.find(params[:patient_id])
    @prescription = @patient.prescriptions.find(params[:prescription_id])
    @drug_reminders = @prescription.drug_reminders.order(reminder_time: :asc)
  end
end
