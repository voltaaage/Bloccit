class Topic < ActiveRecord::Base
  has_many :posts

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, presence: true
end
