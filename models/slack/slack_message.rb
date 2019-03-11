require 'json'

class SlackMessage
  attr_accessor :text, :response_type, :mrkdwn

  def initialize(text, mrkdwn = "true", response_type = "in_channel")
    @text = text
    @mrkdwn = mrkdwn
    @response_type = response_type
  end

  # serialize the model and return JSON 
  def serialize
    response = {
      "response_type" => self.response_type,
      "blocks" => [
        {
          "type": "section",
          "text": {
            "type": "mrkdwn",
            "text": self.text
          }
        }
      ]
    }
    
    response.to_json
  end

end