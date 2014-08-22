class Micropost < ActiveRecord::Base
  validates :content, length: { maximum: 140, minimum: 1 }
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
end