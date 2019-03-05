class Prescription < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :appointment

  has_many :prescription_drugs
  has_many :drug_reminders

  #Pre define time for medicine
  REMINDER_TIME = { morning_before_food: "08:00 AM", morning_after_food: "10:00 AM", afternoon_before_food: "12:00 PM", afternoon_after_food: "14:00 PM", evening_before_food: "16:00 PM",evening_after_food: "18:00 PM", night_before_food: "20:00 PM", night_after_food: "22:00 PM" }

  def create_prescription_reminder
    return if reminder_set
    prescription_drugs.each do |prescription_drug|
      (1..prescription_drug.days).each do |day|
        date = (Time.now + day.day).strftime("%Y-%m-%d")

        reminder_data = prescription_drug.attributes.slice(
        'morning_before_food', 'morning_after_food', 'afternoon_before_food', 'afternoon_after_food','evening_before_food', 'evening_after_food', 'night_before_food', 'night_after_food')
        #create reminder for each dose
        reminder_data.each_key do |field|
          next if reminder_data[field].blank?
          time = Time.parse("#{date} #{REMINDER_TIME[field.to_sym]}").in_time_zone("Mumbai")

          message = "Medicine Time : #{prescription_drug.drug_name} - #{prescription_drug[field]} #{REMINDER_TIME[field.to_sym]} - Have you taken medicine?"

          DrugReminder.create(patient: self.patient, prescription: self, reminder_time: time, reminder_message: message)
        end
      end
    end
    update_attributes(reminder_set: true)
  end

  def self.bulk_reminder_create
    prescriptions = Prescription.where(reminder_set: false)
    prescriptions.each do |prescription|
      prescription.create_prescription_reminder
    end
  end
end
