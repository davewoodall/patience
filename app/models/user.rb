class User < ApplicationRecord
  has_many :recommendations, dependent: :destroy
  has_many :identifications, dependent: :destroy
  accepts_nested_attributes_for :recommendations, allow_destroy: true
  accepts_nested_attributes_for :identifications, allow_destroy: true

  validates :name, presence: true, length: { maximum: 120 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :dob, presence: true
end
