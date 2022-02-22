class Blog < ApplicationRecord
  # belongs_to :user
  belongs_to :user, foreign_key: 'user_id'

  def user
    User.find(@blog.user_id)
  end
end
