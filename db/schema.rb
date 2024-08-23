# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_11_070756) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ambulances", force: :cascade do |t|
    t.string "name"
    t.string "registration_number"
    t.string "status"
    t.float "latitude"
    t.float "longitude"
    t.string "driver_name"
    t.string "driver_contact"
    t.text "equipment_list"
    t.datetime "last_serviced_at"
    t.datetime "service_due_at"
    t.integer "mileage"
    t.float "fuel_level"
    t.string "emergency_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hospital_id"
    t.index ["hospital_id"], name: "index_ambulances_on_hospital_id"
  end

  create_table "hospital_ambulances", force: :cascade do |t|
    t.bigint "hospital_id", null: false
    t.bigint "ambulance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ambulance_id"], name: "index_hospital_ambulances_on_ambulance_id"
    t.index ["hospital_id"], name: "index_hospital_ambulances_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "country", null: false
    t.string "phone_number", null: false
    t.string "email_address"
    t.string "emergency_contact"
    t.integer "capacity", null: false
    t.string "specialties"
    t.string "operating_hours", null: false
    t.string "insurance_accepted"
    t.string "website"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ambulances", "hospitals"
  add_foreign_key "hospital_ambulances", "ambulances"
  add_foreign_key "hospital_ambulances", "hospitals"
end
