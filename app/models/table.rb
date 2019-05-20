class Table < ApplicationRecord
    has_many  :reservations, dependent: :destroy 
    validates :status, presence: true
end
