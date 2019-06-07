class Api::V1::NotificationsController < ApplicationController
  protect_from_forgery except: :create

  CHANNELS = {
    buda: ENV.fetch('BUDA_CHANNEL_NAME'),
    fintual: ENV.fetch('FINTUAL_CHANNEL_NAME'),
    platanus: ENV.fetch('PLATANUS_CHANNEL_NAME'),
  }

  def create
    if notification_params[:is_private]
      slack.notify_user(User.find(notification_params[:user_id]))
    else
      slack.notify_channel(
        CHANNELS[notification_params[:company_name].to_sym],
        notification_params[:message])
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
