# https://api.slack.com/slash-commands
class SlackCommand
  attr_reader :token, :command, :text, :response_url, :trigger_id, :user_id, :user_name, :team_id, :team_domain, :channel_id, :channel_name

  def initialize(params)
    @token = params["token"]
    @command = params["command"]
    @text = params["text"]
    @response_url = params["response_url"]
    @trigger_id = params["trigger_id"]
    @user_id = params["user_id"]
    @user_name = params["user_name"]
    @team_id = params["team_id"]
    @team_domain = params["team_domain"]
    @channel_id = params["channel_id"]
    @channel_name = params["channel_name"]
  end

end