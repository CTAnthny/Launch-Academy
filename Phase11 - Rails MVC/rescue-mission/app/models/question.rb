class Question < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true, length: { minimum: 5, maximum: 75 }
  validates :body, presence: true, length: { minimum: 5, maximum: 500 }
end
