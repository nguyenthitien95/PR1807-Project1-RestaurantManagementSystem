class Dish < ApplicationRecord
    belongs_to :category
    has_many :reserved_dishes, dependent: :destroy
    validates :category, :name, :price, :promotion, :status, presence: true
    validates :description, presence: true, length: {minimum:1, maximum:1000}
end
