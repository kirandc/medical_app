# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = [
  "super_admin",
  "admin",
  "doctor",
  "patient",
  "nurse",
  "accountant"
]

roles.each do |role|
  Role.find_or_create_by(name: role)
end

#Creating sample data for Doctor
doctor_role = Role.where(name: 'doctor').first
doctor_user = User.new({ username: 'nayan', name: 'Dr. Nayan', is_active: true, mobile: '9876543211', email: 'nayan@gmail.com', dob: Date.parse('1980/3/1'), gender: 'Male', registered_on: Date.today, role: doctor_role })
doctor = Doctor.create({specialization: "General Surgery", qualifications: "MBBS London"})
doctor_user.resource = doctor
doctor_user.save!

#Creating sample data for Patient
patient_role = Role.where(name: 'patient').first
patient_user = User.new({ username: 'kiran', name: 'Kiran Chaudhari', is_active: true, mobile: '9899009900', email: 'kiran@gmail.com', dob: Date.parse('1983/5/6'), gender: 'Male', registered_on: Date.today, role: patient_role })
patient = Patient.create({past_history: 'no', allergy: 'no allergy'})
patient_user.resource = patient
patient_user.save!

#Creating sample data for Appointment

appointment = Appointment.create!(start_time: Time.new(2019, 03, 10, 11, 0, 0), end_time: Time.new(2019, 03, 10, 11, 15, 0), doctor: doctor, patient: patient)

prescription = Prescription.create!(appointment: appointment, doctor: doctor, patient: patient, complaints: 'fever from last night')

prescription_drug1 = PrescriptionDrug.create(prescription: prescription, drug_name: "Drug 1",
  instruction: "Take more water", morning_after_food: "1 tablet", afternoon_after_food: "1 tablet",
  night_after_food: "1 tablet", days: 3)

prescription_drug2 = PrescriptionDrug.create(prescription: prescription, drug_name: "Drug 2",
  morning_before_food: "1 tablet", afternoon_before_food: "1 tablet",
  night_before_food: "1 tablet", days: 3)

prescription_drug3 = PrescriptionDrug.create(prescription: prescription, drug_name: "Drug 3",
  morning_after_food: "1 tablet", afternoon_after_food: "1 tablet",
  night_after_food: "1 tablet", days: 5)
