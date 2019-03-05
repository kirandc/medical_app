class CreatePrescriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :prescriptions do |t|
      t.integer  :appointment_id
      t.integer  :doctor_id
      t.integer  :patient_id
      t.text     :complaints
      t.text     :findings
      t.text     :instructions
      t.text     :report_details
      t.boolean  :reminder_set,  default: false
      t.timestamps
    end
    add_index :prescriptions, :appointment_id
    add_index :prescriptions, :doctor_id
    add_index :prescriptions, :patient_id
  end
end
