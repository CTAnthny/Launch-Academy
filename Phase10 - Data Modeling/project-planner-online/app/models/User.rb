class User < ActiveRecord::Base
  has_many :joins
  has_many :projects, through: :joins

  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, uniqueness: true, length: { in: 2..30 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, allow_nil: true, allow_blank: true

  def compute_fullname
    "#{:first_name} #{:last_name}"
  end
end
