class User < ApplicationRecord
  has_many  :reservations, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 50 }
  before_save :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :address, presence: true, length: {minimum: 5, maximum: 150}
  VALID_PHONE_REGEX = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
  validates :phone_number, presence: true, length{minimum: 10, maximum: 10},
            format: { with: VALID_PHONE_REGEX }
  private
  def downcase_email
    self.email = email.downcase
  end
end
