class ReservedDish < ApplicationRecord
    belongs_to :reservation
    validates  :reservation_id, :dish_id, :quantity, presence: true
end
