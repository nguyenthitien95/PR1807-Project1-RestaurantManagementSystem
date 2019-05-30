class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_many  :reserved_dishes, dependent: :destroy
  validates :user, :table, :date_time, presence: true
  validates :numbers_people, presence: true, numericality: {greater_than_or_equal_to: 0}
end
