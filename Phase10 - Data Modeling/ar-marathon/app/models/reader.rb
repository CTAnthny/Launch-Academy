class Reader < ActiveRecord::Base
  has_many :checkouts

  validates :name, presence: true, uniqueness: true, length: { in: 3..25 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :phone_number, presence: true, numericality: { only_integer: true }
end
