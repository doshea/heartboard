class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      
      t.date :dob

      t.string :gender
      t.string :race
      t.string :ethnicity
      t.string :language

      t.hstore :allergies
      
      t.string :username
      t.string :image
      t.string :email
      t.string :password_digest

      t.string :phone_number
      t.string :street_address
      t.string :street_address_2
      t.string :city
      t.string :state
      t.integer :zip_code

      t.belongs_to :user
      t.belongs_to :guardian

      t.timestamps null: false
    end
  end
end