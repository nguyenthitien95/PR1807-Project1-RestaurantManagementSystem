class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  before_save :downcase_email
  attr_accessor :remember_token, :activation_token, :password_reset_token

  validates :name,  presence: true, length: {maximum: 50},
            format: {with: /[a-zA-Z\s]{1,50}/}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PHONE_REGEX = /[+]{0,1}([0-9]{2,4})?[-. ]?([0-9]{3})[-. ]?([0-9]{4})/
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  validates :phone_number, presence: true, format: {with: VALID_PHONE_REGEX}
  validates :address, presence: true, length: {minimum: 5, maximum: 150}, allow_nil: true

  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?token
  end

  def forget
    update_attribute :remember_digest, nil
  end

  private
  def downcase_email
    self.email = email.downcase
  end
end
