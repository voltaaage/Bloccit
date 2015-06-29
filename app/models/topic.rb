class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, presence: true

  self.per_page = 50

  scope :visible_to, -> (user) { user ? all : where(public: true)}
end
