class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user
  belongs_to :topic

  default_scope { order('rank DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  mount_uploader :image, ImageUploader

  def markdown_title
    render_as_markdown(title)
  end

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    return votes.sum(:value)
  end

  def markdown_body
    render_as_markdown(body)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / ( 60 * 60 * 24 )
    new_rank = points + age_in_days

    update_attribute(:rank, new_rank)
  end

  def create_vote
    user.votes.create(post: self, value: 1)
  end
  
  private


  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

end
