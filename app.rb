require 'json'

class App < Sinatra::Base
  use Authenticate

  post '/' do 
    # parse params
    command = SlackCommand.new(params)

    # create response message
    text = "#{command.text} back atcha."
    message = SlackMessage.new(text)

    # return serialized message
    content_type :json
    message.serialize
  end

end