class Category < ApplicationRecord
  has_many  :dishes
  has_many :categories
  belongs_to :category, optional: true
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 1, maximum: 1000}
end
