class Review < ApplicationRecord
  belongs_to :restaurant

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: (1..5).to_a }
  validates :body, presence: true, length: { in: 15..500 }
end
