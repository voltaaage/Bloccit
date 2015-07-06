class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, length: {minimum: 5}, presence: true
  validates :user_id, presence: true

  after_create :send_favorite_emails

  default_scope { order('updated_at DESC')}

  private

  def send_favorite_emails
    post.favorites.each do |favorite|
      if user_id != favorite.user_id && favorite.user.email_favorites?
        FavoriteMailer.new_comment(favorite.user, post, self).deliver_now
      end
    end
  end

end
