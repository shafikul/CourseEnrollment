class CourseOffer < ActiveRecord::Base
  belongs_to :course
  belongs_to :semester

  validates :course_id, presence: true
  validates :semester_id,  presence: true
end
