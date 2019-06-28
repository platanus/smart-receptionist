class SlackService

  def initialize
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
    end
  end

  def notify_channel(channel, message)
    client.chat_postMessage(channel: channel, text: message, as_user: true)
  end

  def notify_user(user)
    client.chat_postMessage(
      channel: user.slack_id,
      as_user: true,
      text: "#{user.name}, te buscan en la entrada!"
  )
  end

  def get_slack_user(id)
    client.users_info(user: id).user
  end

  def create_users_from_slack_channel(channel = '#coffeebar')
    existing_user_ids = User.all.map { |user| user.slack_id }
    coffeebar_user_ids = client.channels_info(channel: channel).channel.members
    coffeebar_user_ids.each do |user_id|
      slack_user = get_slack_user(user_id)
      new_user = User.find_or_create_by(slack_id: slack_user.id)
      new_user.update(
        is_admin: slack_user.is_admin, is_bot: slack_user.is_bot,
        name: slack_user.name, email: slack_user.profile.email, deleted: slack_user.deleted,
        image_72: slack_user.profile.image_72, real_name: slack_user.real_name,
        display_name: slack_user.profile.display_name
      )
    end

    existing_user_ids.each do |user_id|
      if coffeebar_user_ids.exclude? user_id
        User.find_by(slack_id: user_id).delete
      end
    end
  end

  private

  def client
    @client ||= Slack::Web::Client.new
  end
end
