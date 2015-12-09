class Course < ActiveRecord::Base
  has_many :course_offers, dependent: :destroy
  has_many :semesters, through: :course_offers
  has_many :stores, dependent: :destroy
  has_many :users, through:  :stores

  validates :name, presence: true, length:{minimum: 2, maximum: 8}
  validates :course_no, presence: true, length:{minimum: 5,maximum: 11}, uniqueness: true
end
