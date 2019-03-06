# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_05_054816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "doctor_id"
    t.integer "patient_id"
    t.string "status", default: "open"
    t.float "weight"
    t.float "height"
    t.float "temperature"
    t.float "heart_rate"
    t.string "blood_pressure"
    t.integer "bill_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "specialization"
    t.string "qualifications"
    t.string "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drug_reminders", force: :cascade do |t|
    t.integer "prescription_id"
    t.integer "patient_id"
    t.datetime "reminder_time"
    t.text "reminder_message"
    t.string "reminder_reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_drug_reminders_on_patient_id"
    t.index ["prescription_id"], name: "index_drug_reminders_on_prescription_id"
  end

  create_table "patients", force: :cascade do |t|
    t.integer "doctor_id"
    t.text "past_history"
    t.text "allergy"
    t.text "family_history"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
  end

  create_table "prescription_drugs", force: :cascade do |t|
    t.integer "prescription_id"
    t.string "drug_name"
    t.string "instruction"
    t.string "morning_before_food"
    t.string "morning_after_food"
    t.string "afternoon_before_food"
    t.string "afternoon_after_food"
    t.string "evening_before_food"
    t.string "evening_after_food"
    t.string "night_before_food"
    t.string "night_after_food"
    t.integer "days"
    t.boolean "reminder_sent", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prescription_id"], name: "index_prescription_drugs_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer "appointment_id"
    t.integer "doctor_id"
    t.integer "patient_id"
    t.text "complaints"
    t.text "findings"
    t.text "instructions"
    t.text "report_details"
    t.boolean "reminder_set", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_prescriptions_on_appointment_id"
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "mobile"
    t.string "landline"
    t.string "email"
    t.string "gender"
    t.datetime "dob"
    t.boolean "is_active", default: false
    t.string "resource_type"
    t.integer "resource_id"
    t.date "registered_on"
    t.string "name"
    t.boolean "is_app_installed", default: false
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["resource_type", "resource_id"], name: "index_users_on_resource_type_and_resource_id", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
