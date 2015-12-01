class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name

      t.string :image

      t.string :street_address
      t.string :street_address_2
      t.string :city
      t.string :state
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end