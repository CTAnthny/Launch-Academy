class Meetup < ActiveRecord::Base
  CATEGORIES = ["Adventure", "Book Club", "Film", "Health & Wellness", "Hobbies & Crafts", "Learning", "Social", "Sports & Fitness", "Tech"]
  LOCATIONS = ["Callisto", "Ceres", "Dione", "Enceladus", "Europa", "Ganymede", "Mars", "the Moon", "Titan"]

  has_many :users, through: :registrations
  has_many :registrations
  belongs_to :creator, class_name: 'User'

  validates :creator, :category, :location, :description, presence: true
  validates :title, uniqueness: true, length: { in: 2..50 }
  validates :category, inclusion: { in: CATEGORIES }
  validates :location, inclusion: { in: LOCATIONS }
  validates :description, length: { maximum: 5000 }
end
