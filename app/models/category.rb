class Category < ApplicationRecord
  has_many  :dishes
  validates :parent_id, presence: true
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 1, maximum: 1000}
  validates :status, inclusion: {in: [true, false]}
end
