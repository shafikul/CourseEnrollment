class Course < ActiveRecord::Base
  has_many :course_offers, dependent: :destroy
  has_many :semesters, through: :course_offers
  has_many :stores, dependent: :destroy
  has_many :users, through:  :stores
end
