class Course < ActiveRecord::Base
  has_many :course_offers
  has_many :semesters, through: :course_offers
  has_many :stores
  has_many :users, through:  :stores
end
