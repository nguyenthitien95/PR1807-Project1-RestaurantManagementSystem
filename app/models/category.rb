class Category < ApplicationRecord
    has_many :dishes, dependent: :destroy
    validates :name, :status, :parent_id, presence: true
    validates :description, presence: true, length: {minimum:1, maximum:1000}
end
