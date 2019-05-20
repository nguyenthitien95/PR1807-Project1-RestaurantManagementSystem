class ReservedDish < ApplicationRecord
    belong_to :reservation
    belong_to :dish
    validates :reservation, :dish, :quantity, presence: true 
end
