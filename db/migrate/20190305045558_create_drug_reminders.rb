class CreateDrugReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :drug_reminders do |t|
      t.integer     :prescription_id
      t.integer     :patient_id
      t.text        :reminder_message
      t.string      :reminder_reply
      t.timestamps
    end

    add_index :drug_reminders, :prescription_id
    add_index :drug_reminders, :patient_id
  end
end
