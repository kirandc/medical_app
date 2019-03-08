class PrescriptionDrugSerializer < ActiveModel::Serializer
  attributes :id, :drug_name, :instruction, :morning_before_food, :morning_after_food, :afternoon_before_food, :afternoon_after_food, :evening_before_food, :evening_after_food, :night_before_food, :night_after_food, :days
end
