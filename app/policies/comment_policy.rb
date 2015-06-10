class CommentPolicy < ApplicationPolicy
  def new
    user.present?
  end

  def create
    new?
  end
end
