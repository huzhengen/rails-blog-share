class Blog < ApplicationRecord
  # belongs_to :user
  belongs_to :user, foreign_key: 'user_id'
end
