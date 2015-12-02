class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stores, dependent: :destroy
  has_many :courses, through: :stores

end
