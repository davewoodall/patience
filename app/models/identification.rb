class Identification < ApplicationRecord
  belongs_to :user
  validates :number, presence: true, length: { maximum: 120 }
  validates :state, presence: true, length: { maximum: 2 }
  has_one_attached :image_upload

  def is_expired?
    self.expiration < 1.day.ago
  end
end
