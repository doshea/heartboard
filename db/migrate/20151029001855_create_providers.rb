class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :work_phone
      t.string :mobile_phone
      t.string :pager
      t.belongs_to :user

      t.timestamps
    end
  end
end
