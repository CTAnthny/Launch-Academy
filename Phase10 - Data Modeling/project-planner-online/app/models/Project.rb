class Project < ActiveRecord::Base
  has_many :joins
  has_many :users, through: :joins

  validates :name, presence: true, length: { in: 2..50 }
  validates :description, length: { maximum: 2500 }, allow_nil: true, allow_blank: true
end
