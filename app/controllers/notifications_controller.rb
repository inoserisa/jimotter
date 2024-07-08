class NotificationsController < ApplicationController
  # def index
  #   @notifications = current_user.notifications.order(created_at: :desc).limit(5)
  #   @notifications.where(checked: false).each do |notification|
  #     notification.update(checked: true)
  #   end
  # end

  def mark_as_read
    current_user.notifications.where(checked: false).update_all(checked: true)
    head :no_content
  end
end
