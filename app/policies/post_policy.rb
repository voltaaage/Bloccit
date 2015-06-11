class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def destroy
    user.present? && (record.user == user || user.admin? || user.moderator)
  end

end