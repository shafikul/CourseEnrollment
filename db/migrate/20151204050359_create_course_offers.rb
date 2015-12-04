class CreateCourseOffers < ActiveRecord::Migration
  def change
    create_table :course_offers do |t|
      t.integer :semester_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
