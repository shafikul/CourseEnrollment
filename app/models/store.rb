class Store < ActiveRecord::Base
  belongs_to :user
  belongs_to :semester
  belongs_to :course
  before_save :duplicate_course_check
  validates :user_exists?
  validates :cgpa, numericality: {greater_than_or_equal_to: 0.0}
  validates :cgpa, numericality: {less_than_or_equal_to: 4.0}
  private

  def duplicate_course_check
    # TODO implement later
  end
  def user_exists?
    return false if Course.find_by_id(self.course_id).nil?
  end
end
