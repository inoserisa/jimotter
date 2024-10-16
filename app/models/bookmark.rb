class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notifications

  validates :user_id, uniqueness: { scope: :post_id }

  private

  def create_notifications
    Notification.create(subject: self, user: post.user, action_type: :bookmarked_to_own_post)
  end
end
