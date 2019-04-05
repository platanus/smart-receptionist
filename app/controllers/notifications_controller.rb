class NotificationsController < ApplicationController
  protect_from_forgery except: :create

  def create
    if notification_params[:is_private]
      slack.notify_user(User.find(notification_params[:user_id]))
    end
  end

  private

  def slack
    @slack ||= SlackService.new
  end

  def notification_params
    params.require(:notification).permit!
  end
end
