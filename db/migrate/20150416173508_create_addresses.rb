class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street_name
      t.text :street_address
      t.text :secondary_address
      t.integer :building_number
      t.integer :zip_code
      t.string :time_zone
      t.string :street_suffix
      t.string :city_suffix
      t.string :city_prefix
      t.string :state_abbr
      t.string :state
      t.string :country
      t.text :latitude
      t.text :longitude

      t.timestamps
    end
  end
end
