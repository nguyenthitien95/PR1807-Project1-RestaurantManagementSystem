class Staff < ApplicationRecord
    has_many  :salaries, dependent: :destroy
    validates :name, :username, presence: true, length: { maximum: 50 }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    validates :gender, :base_salary, presence: true 
    validates :title, presence: true, length: {minimum:1, maximum:100}
end
