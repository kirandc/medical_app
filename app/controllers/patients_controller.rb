class PatientsController < ApplicationController

  def index
    #Showing first doctor patients list
    @doctor = Doctor.first
    @patients = @doctor.patients.includes(:user)
  end

end
