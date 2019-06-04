class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  before_save :downcase_email
  attr_accessor :remember_token, :activation_token, :reset_token
  before_create :create_activation_digest

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

  def activate
    update_attribute :activated,    true
    update_attribute :activated_at, Time.zone.now
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute :reset_digest,  User.digest(reset_token)
    update_attribute :reset_sent_at, Time.zone.now
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  private
  def downcase_email
    self.email = email.downcase
  end

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
