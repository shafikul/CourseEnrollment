class CreateUserdetails < ActiveRecord::Migration
  def change
    create_table :userdetails do |t|
      t.integer :user_id
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :contact_no

      t.timestamps null: false
    end
  end
end
