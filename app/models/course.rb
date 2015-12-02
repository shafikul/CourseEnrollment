class Course < ActiveRecord::Base
  has_many :stores,  dependent: :destroy
  has_many :users,  through: :stores
  validates :name, presence: true
  validates :course_no, presence: true, uniqueness: true
end
