class Semester < ActiveRecord::Base
  has_many :store, dependent: :destroy
  validates :name, presence: true
  validates :semester_type, presence: true

end
