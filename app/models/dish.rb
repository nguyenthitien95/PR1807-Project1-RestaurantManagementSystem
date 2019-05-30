class Dish < ApplicationRecord
  belongs_to :category
  has_many   :reserved_dishes, dependent: :destroy
  validates  :category, :name, :price, :promotion, :status, presence: true
  validates  :name, presence: true, length: {minimum: 1, maximum: 50}
  validates  :promotion, presence: true, inclusion: {in: (0..100).to_a}
  validates  :description, presence: true, length: {minimum: 1, maximum: 1000}
end
