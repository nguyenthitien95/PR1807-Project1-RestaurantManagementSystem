class Reservation < ApplicationRecord
    has_many :reserved_dishes, dependent: :destroy
    validates :user_id, :table_id, :numbers_people, :status, :date_time, presence: :true
end
