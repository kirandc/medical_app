class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer  :doctor_id
      t.integer  :patient_id
      t.string   :status,                      default: "open"
      t.float    :weight
      t.float    :height
      t.float    :temperature
      t.float    :heart_rate
      t.string   :blood_pressure
      t.integer  :bill_amount
      t.timestamps
    end
    add_index :appointments, :doctor_id
    add_index :appointments, :patient_id
  end
end
