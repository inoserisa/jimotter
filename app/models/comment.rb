class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notifications

  validates :comment_content, presence: true, length: { maximum: 65_535 }

  private
  def create_notifications
    Notification.create(subject: self, user: post.user, action_type: :commented_to_own_post)
  end
end
