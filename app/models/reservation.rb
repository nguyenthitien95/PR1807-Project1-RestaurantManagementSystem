class Reservation < ApplicationRecord
   has_many :reserved_dishes, dependent: :destroy
   validates :user_id, :table_id, :status, :numbers_people, :datetime, presence: true
end
