class Review < ApplicationRecord
  # A review must belong to a restaurant.
  belongs_to :restaurant

  # A review must have content and a rating.
  validates :content, presence: true

  # A review’s rating must be a number between 0 and 5.
  validates :rating,  numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
