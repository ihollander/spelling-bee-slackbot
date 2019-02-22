require 'json'

class MessageAttachment

  def initialize

  end

  def serialize
    {

    }
  end

end

class SlackMessage
  attr_accessor :text, :response_type, :attachments

  def initialize(text, response_type = "in_channel")
    @text = text
    @response_type = response_type
    @attachments = []
  end

  # serialize the model and return JSON 
  def serialize
    response = {
      "response_type" => self.response_type,
      "text" => self.text
    }

    if self.attachments.count > 0
      response["attachments"] = self.attachments.map { |a| a.serialize }
    end
    
    response.to_json
  end

end