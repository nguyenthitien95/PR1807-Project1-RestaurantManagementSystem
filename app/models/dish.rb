class Dish < ApplicationRecord
  belongs_to :category
  scope :only_display, -> {where :is_display => true}
  has_many   :reserved_dishes, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates  :category, :name, :price, :promotion, presence: true
  validates  :name, presence: true, length: {minimum: 1, maximum: 50}
  validates  :promotion, presence: true, inclusion: {in: (0..100).to_a}
  validates  :description, presence: true, length: {minimum: 1, maximum: 1000}
  validate  :image_size

  private
  def image_size
    if image.size > 5.megabytes
      errors.add :image, "should be less than 5MB"
    end
  end
end
