class Semester < ActiveRecord::Base
  has_many :course_offers, dependent: :destroy
  has_many :courses, through: :course_offers
  has_many :stores, dependent: :destroy
end
