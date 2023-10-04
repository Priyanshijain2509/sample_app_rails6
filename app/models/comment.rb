class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  default_scope -> { order(created_at: :desc) }
  validates :body, presence: true, length: { minimum: 5 }
end
