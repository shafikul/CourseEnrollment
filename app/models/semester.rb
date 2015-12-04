class Semester < ActiveRecord::Base
  has_many :course_offers
  has_many :courses, through: :course_offers
  has_many :stores
end
