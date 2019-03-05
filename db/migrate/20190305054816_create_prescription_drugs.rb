class CreatePrescriptionDrugs < ActiveRecord::Migration[5.2]
  def change
    create_table :prescription_drugs do |t|
      t.integer       :prescription_id
      t.string        :drug_name
      t.string        :instruction
      t.string        :morning_before_food
      t.string        :morning_after_food
      t.string        :afternoon_before_food
      t.string        :afternoon_after_food
      t.string        :evening_before_food
      t.string        :evening_after_food
      t.string        :night_before_food
      t.string        :night_after_food
      t.integer       :days
      t.boolean       :reminder_sent,  default: :false
      t.timestamps
    end

    add_index :prescription_drugs, :prescription_id
  end
end
