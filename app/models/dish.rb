class Dish < ApplicationRecord
    belongs_to :category
    validates :category, :name, :price, :promotion, :status, presence: true
    validates :description, presence: true, length: {minimum:1, maximum:1000}
end
