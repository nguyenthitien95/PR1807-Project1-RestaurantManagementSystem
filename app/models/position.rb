class Position < ApplicationRecord
  has_many :users
  validates :name, :description, :salary, presence: true
end
