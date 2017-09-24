class Car < ApplicationRecord
  belongs_to :manufacturer

  validates :name, presence: true
  validates :color, length: { in: 3..10 }
  validates :year, format: { with: /\A(19|20)\d{2}\z/, message: "only allows greater than 1900"}
  validates :mileage, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { maximum: 500 }
end
