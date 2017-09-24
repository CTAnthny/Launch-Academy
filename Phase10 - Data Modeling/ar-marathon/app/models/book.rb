class Book < ActiveRecord::Base
  has_many :checkouts
  has_and_belongs_to_many :categories

  validates :title, presence: true, length: { in: 3..40 }
  validates :rating, numericality: { in: 0..100 },
    unless: "rating.nil?"
end
