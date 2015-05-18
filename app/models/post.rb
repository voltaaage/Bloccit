class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  # default_scope { order('created_at DESC') }
  # default_scope { order('title') }
  default_scope { order('created_at ASC') }
end
