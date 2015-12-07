class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stores, dependent: :destroy
  has_many :courses, through: :stores

  def courses_by_semester semester_id
    courses = []
    self.courses.each do |c|
      courses << c if c.stores.find_by({semester_id: semester_id})
    end
    return courses
  end

end