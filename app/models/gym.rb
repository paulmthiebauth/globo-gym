class Gym < ActiveRecord::Base
  has_many :users
  validates :name, presence: true
  validates :street, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :phone_number, presence: true
end
