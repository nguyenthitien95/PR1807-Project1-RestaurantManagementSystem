class Staff < ApplicationRecord
  has_many  :salaries, dependent: :destroy
  belongs_to :position
  before_save :downcase_username
  validates :name, presence: true, length: {maximum: 50}
  validates :birth_date, :status, :address, presence: true
  validates :gender, presence: true, inclusion: {in: ["male", "female", "other"]}
  validates :username, presence: true, format: {with: /[a-zA-Z0-9._]{5,50}/},
            uniqueness: {case_sensitive: false}
  VALID_PHONE_REGEX = /[+]{0,1}([0-9]{2,4})?[-. ]?([0-9]{3})[-. ]?([0-9]{4})/
  validates :phone_number, presence: true, format: {with: VALID_PHONE_REGEX}

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  private
  def downcase_username
    self.username = username.downcase
  end
end
