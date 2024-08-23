class CreateAmbulanceTable < ActiveRecord::Migration[7.1]
  def change
    create_table :ambulances do |t|
      t.string :name
      t.string :registration_number
      t.string :status
      t.float :latitude
      t.float :longitude
      t.string :type
      t.string :driver_name
      t.string :driver_contact
      t.text :equipment_list
      t.datetime :last_serviced_at
      t.datetime :service_due_at
      t.integer :mileage
      t.float :fuel_level
      t.string :emergency_contact

      t.timestamps
    end
  end
end
