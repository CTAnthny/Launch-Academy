class Comment < ActiveRecord::Base
  belongs_to :question
  validates :commenter, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true, length: { minimum: 5, maximum: 500 }
end
