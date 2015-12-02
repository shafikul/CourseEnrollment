class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :user_id
      t.integer :semester_id
      t.integer :course_id
      t.decimal :cgpa, precision: 2, scale:2

      t.timestamps null: false
    end
  end
end
