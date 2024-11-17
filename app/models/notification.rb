class Notification < ApplicationRecord
  belongs_to :subject, polymorphic: true
  belongs_to :user

  enum :action_type, { commented_to_own_post: 0, bookmarked_to_own_post: 1, answered_to_own_question: 2 }
end
