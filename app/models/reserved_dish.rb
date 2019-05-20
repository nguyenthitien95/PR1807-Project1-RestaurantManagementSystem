class ReservedDish < ApplicationRecord
    belong_to :reservation
    belong_to :dish
    validates :reservation_id, :dish_id, :quantity, presence: true 
end
