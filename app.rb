require 'json'

class App < Sinatra::Base
  use Authenticate

  post '/' do
    # parse params
    command = SlackCommand.new(params)
    
    text = ""

    if command.text.strip.includes "-"
      # parse args
      case command.text.strip
      when "-help"

      end
    else
      # create response message
      @game = Game.find_by(date: Date.today)
      if !@game
        @game = Game.generate
      end
      text = "Today's letters: #{@game.print_letters}"
      
      
    end

    message = SlackMessage.new(text)

    # return serialized message
    content_type :json
    message.serialize
  end

end