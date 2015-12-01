class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex, default: 'Not Set'

      t.string :email, null: false
      t.string :username, null: false
      t.string :image

      t.string :password_digest
      t.string :auth_token

      t.boolean :is_admin, default: false

      t.string   "time_zone", default: "Pacific Time (US & Canada)"

      t.timestamps null: false
    end
  end
end
