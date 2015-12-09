class Semester < ActiveRecord::Base

  has_many :course_offers, dependent: :destroy
  has_many :courses, through: :course_offers
  has_many :stores, dependent: :destroy
  validates :semester_name, presence:true, uniqueness: true, length: {minimum: 2, maximum: 6}
  validates :semester_type, presence: true

end
