class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :subject
      t.text :description

      t.datetime :scheduled_time

      t.belongs_to :provider
      t.belongs_to :patient
      t.belongs_to :department

      t.timestamps null: false
    end
  end
end
