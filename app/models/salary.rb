class Salary < ApplicationRecord
    belong_to :staff
    validates :staff, :salary, :from_date, :to_date, presence: true 
end
