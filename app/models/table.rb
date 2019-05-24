class Table < ApplicationRecord
  has_many :reservations
  validates :status, inclusion: {in: [true, false]}
end
