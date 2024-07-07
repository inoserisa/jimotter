class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :prefecture
  belongs_to :city

  has_one :notification, as: :subject, dependent: :destroy
  after_create_commit :create_notifications

  validates :content, presence: true, length: { maximum: 355 }

  private

  def create_notifications
    Notification.create(subject: self, user: question.user, action_type: :answered_to_own_question)
  end
end
