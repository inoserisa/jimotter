module NotificationsHelper
  def transition_path(notification)
    case notification.action_type.to_sym
    when :commented_to_own_post
      post_path(notification.subject.post, anchor: "comment-#{notification.subject.id}")
    when :bookmarked_to_own_post
      post_path(notification.subject.post)
    when :answered_to_own_question
      question_path(notification.subject.question, anchor: "comment-#{notification.subject.id}")
    end
  end
end
